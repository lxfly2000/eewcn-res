import QtQuick 2.14
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15 as QControl2
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.1

TabView {
    property int versionInt: 0x00000000
    property bool isTouchEnvironment: false
    tabPosition: Qt.BottomEdge
    signal tabViewSetMapCenter(double lat,double lng)
    signal tabViewShowIntensity(double lat,double lng,double mag,double depth)
    signal tabViewShowIntensityWithEpiIntensity(double lat,double lng,double mag,double depth,double epiIntensity)
    style: TabViewStyle {
        frameOverlap: 1
        tab: Rectangle {
            color: styleData.hovered ? Qt.lighter("aqua",1.75) : "lightgray"
            implicitWidth: Math.max(text.width + 4, 80)
            implicitHeight: 20
            Rectangle {
                visible: styleData.selected
                x: 1
                y: 0
                width: parent.width-2
                height: parent.height-1
                color: "white"
            }

            Label {
                id: text
                anchors.centerIn: parent
                text: styleData.title
                color: "black"
            }
        }
        frame: Rectangle {
            color: "white"
            border.color: "lightgray"
        }
    }
    Component{
        id:cmpDelegate
        Rectangle {
            id:rectangleRoot
            //参数：index
            //注意文档中特别提到此处不能用parent（它是一个Component类型，可以理解为一个模板）
            width: ListView.view.width
            height: rowInRectangle.height
            color: "transparent"
            Row {
                id: rowInRectangle
                width: parent.width
                topPadding: 1
                bottomPadding: 1
                Column {
                    width: parent.width-rectangleIntensity.width
                    anchors.rightMargin: 2
                    Text {
                        text: eqLocation
                        width: parent.width
                        wrapMode: Text.Wrap
                        font.pointSize: 12
                        font.family: propFontName()
                    }

                    Row{
                        width: parent.width
                        Text {
                            text: eqTime
                            font.pointSize: 9
                            font.family: propFontName()
                            width: eqIsHead?parent.width:parent.width-textEqMagnitude.width
                            wrapMode: Text.Wrap
                            anchors.bottom: parent.bottom
                        }
                        Text {
                            id: textEqMagnitude
                            text: "M"+eqMagnitude
                            font.pointSize: 12
                            font.family: propFontName()
                            visible: !eqIsHead
                            horizontalAlignment: Text.AlignRight
                        }
                    }

                    Row {
                        width: parent.width
                        visible: eqIsHead
                        Text {
                            id: textHeadEqMagnitude
                            text: rectangleRoot.ListView.view.isStation?(eqStationData):("M"+eqMagnitude)
                            font.pointSize: 12
                            font.family: propFontName()
                        }
                        Text {
                            text: eqDepth+(rectangleRoot.ListView.view.isStation?"m":"km")
                            font.pointSize: 12
                            font.family: propFontName()
                            width: parent.width-textHeadEqMagnitude.width
                            anchors.bottom: parent.bottom
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                }
                Rectangle{
                    id: rectangleIntensity
                    width: (eqIsHead?54:54*3/4)+2
                    height: eqIsHead?54:54*3/4
                    anchors.verticalCenter: parent.verticalCenter
                    color: "transparent"
                    Rectangle{
                        color: eqBkColor
                        anchors.leftMargin: parent.width-parent.height
                        anchors.fill: parent
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            text: eqIntensity
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                            font.pixelSize: eqIsHead?48:48*3/4
                            font.family: monoFontName()
                            color: eqTextColor
                        }
                    }
                }
            }
            property bool mouseEntered: false
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.AllButtons
                onClicked: {
                    if(mouse.button===Qt.LeftButton){
                        rectangleRoot.ListView.view.currentIndex=index;
                        tabViewSetMapCenter(eqLatitude,eqLongitude);
                    }
                    if(!rectangleRoot.ListView.view.isStation&&mouse.button===Qt.RightButton){
                        rectangleRoot.ListView.view.currentIndex=index;
                        tabViewSetMapCenter(eqLatitude,eqLongitude);
                        contextMenu.popup();
                    }
                }
                onPressAndHold: {
                    if(isTouchEnvironment){
                        rectangleRoot.ListView.view.currentIndex=index;
                        tabViewSetMapCenter(eqLatitude,eqLongitude);
                        contextMenu.popup();
                    }
                }
                onEntered: {
                    parent.color=Qt.lighter("aqua",1.75);
                    parent.mouseEntered=true;
                }
                onExited: {
                    parent.color="transparent";
                    parent.mouseEntered=false;
                }
                Menu{
                    id: contextMenu
                    MenuItem{
                        text: qsTr("View &Intensity on Map")
                        onTriggered: {
                            if(versionInt>=0x02010000){
                                tabViewShowIntensityWithEpiIntensity(eqLatitude,eqLongitude,eqMagnitude,eqDepth,eqIntensity);
                            }else{
                                tabViewShowIntensity(eqLatitude,eqLongitude,eqMagnitude,eqDepth);
                            }
                        }
                    }
                }
            }
            QControl2.ToolTip.delay: 1000
            QControl2.ToolTip.timeout: 10000
            QControl2.ToolTip.visible: mouseEntered
            QControl2.ToolTip.text: {
                if (ListView.view.isStation){
                    return qsTr("Location: %1\nLatitude: %2, Longitude: %3\nHeight: %4m\nDistance: %5km\nIntensity: %6")
                    .arg(eqLocation).arg(eqLatitude).arg(eqLongitude).arg(eqDepth).arg(eqDistance).arg(eqIntensity);
                }else{
                    return qsTr("Time: %1\nLocation: %2\nLatitude: %3, Longitude: %4\nMagnitude: %5\nDepth: %6km\nDistance: %7km\nEpicenter Intensity: %8\nLocal Intensity: %9")
                    .arg(eqTime).arg(eqLocation).arg(eqLatitude).arg(eqLongitude).arg(eqMagnitude).arg(eqDepth).arg(eqDistance).arg(eqIntensity).arg(eqLocalIntensity);
                }
            }
        }
    }

    function now_ts(){
        return new Date().getTime()/1000;
    }

    function fmt_to_ts(fmt){
        return new Date(fmt).getTime()/1000;
    }

    //必须放在ScrollView外面
    ListModel{
        id: historyListModel
    }
    Tab {
        id: tabHistory
        title: qsTr("Records")

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            Settings {
                property alias statShowMt: checkShowMt.checked
            }

            SplitView {
                anchors.fill: parent
                orientation: Qt.Vertical
                ScrollView{
                    Layout.fillHeight: true

                    ListView{
                        width: parent.width
                        model: historyListModel
                        delegate: cmpDelegate
                        highlight: Rectangle{color: Qt.lighter("lightskyblue",1.25)}
                        property bool isStation: false
                    }
                }

                Rectangle {
                    id: rectangleStat
                    visible: checkShowMt.checked
                    implicitHeight: parent.height/4
                    color: "white"
                    property int nowTimeSecond: now_ts()
                    property int recordDays: 7
                    property int recordSeconds: recordDays*24*60*60
                    property real barMinWidth: 3
                    Settings {
                        property alias statRecordDays: rectangleStat.recordDays
                        property alias statBarMinWidth: rectangleStat.barMinWidth
                    }

                    Timer{
                        interval: 60000
                        running: true
                        repeat: true
                        onTriggered: parent.nowTimeSecond=now_ts()
                    }

                    Repeater {
                        model: historyListModel
                        delegate: Component {
                            Rectangle {
                                width: Math.max(parent.barMinWidth, parent.width*60/parent.recordSeconds)
                                height: parent.height*eqMagnitude/10
                                x: parent.width*(fmt_to_ts(eqTime)-parent.nowTimeSecond+parent.recordSeconds)/parent.recordSeconds-width/2
                                y: parent.height-height
                                color: eqBkColor
                            }
                        }
                    }
                    Canvas {
                        anchors.fill: parent
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.strokeStyle = "silver";
                            ctx.font="12px monospace";
                            ctx.beginPath();
                            for (var i=2;i<10;i=i+2){
                                ctx.moveTo(20,parent.height*(10-i)/10);
                                ctx.lineTo(parent.width,parent.height*(10-i)/10);
                                ctx.fillText("M"+i,0,parent.height*(10-i)/10);
                            }
                            ctx.stroke();
                            ctx.closePath();
                        }
                    }
                    property bool mouseEntered: false
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        acceptedButtons: Qt.AllButtons
                        onClicked: {
                            if(mouse.button===Qt.RightButton){
                                contextMenu.popup();
                            }
                        }
                        onPressAndHold: {
                            if(isTouchEnvironment){
                                contextMenu.popup();
                            }
                        }
                        onEntered: {
                            parent.mouseEntered=true;
                        }
                        onExited: {
                            parent.mouseEntered=false;
                        }
                        Menu{
                            id: contextMenu
                            MenuItem{
                                text: qsTr("&Settings…")
                                onTriggered: columnSettingDataRange.visible=true
                            }
                        }
                    }
                    QControl2.ToolTip.delay: 1000
                    QControl2.ToolTip.timeout: 10000
                    QControl2.ToolTip.visible: mouseEntered
                    QControl2.ToolTip.text: qsTr("Magnitude-Time Statistics")
                    Rectangle {
                        id: columnSettingDataRange
                        anchors.fill: parent
                        visible: false
                        ScrollView {
                            anchors.fill: parent
                            Column {
                                Label {
                                    text: qsTr("Days of data to display:")
                                }
                                SpinBox {
                                    id: spinRecordDays
                                    minimumValue: 1
                                    maximumValue: 65535
                                    value: rectangleStat.recordDays
                                }
                                Label {
                                    text: qsTr("Minimum bar width (px):")
                                }
                                SpinBox {
                                    id: spinMinBarWidth
                                    minimumValue: 1
                                    maximumValue: 65535
                                    value: rectangleStat.barMinWidth
                                }

                                Button {
                                    text: qsTr("&OK")
                                    onClicked: {
                                        rectangleStat.recordDays=spinRecordDays.value;
                                        rectangleStat.barMinWidth=spinMinBarWidth.value;
                                        columnSettingDataRange.visible=false;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: checkShowMt.visible ? "white" : "transparent"
                width: checkShowMt.width
                height: checkShowMt.height
                visible: !columnSettingDataRange.visible
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                    onEntered: {
                        checkShowMt.visible=true;
                        //onEntered没有mouse参数
                        //mouse.accepted=false;
                    }
                    onPositionChanged: {
                        checkShowMt.visible=true;
                        mouse.accepted=false;//No effect
                    }
                    onClicked: {
                        checkShowMt.visible=true;
                        mouse.accepted=false;
                    }
                    onPressAndHold: {
                        if(isTouchEnvironment){
                            checkShowMt.visible=true;
                            mouse.accepted=false;
                        }
                    }
                }
                CheckBox {
                    id: checkShowMt
                    checked: true
                    visible: true
                    text: qsTr("Magnitude-Time Statistics")
                    onVisibleChanged: {
                        if(visible){
                            timerCheckShowMtDismiss.start();
                        }
                    }
                }
                Timer {
                    id: timerCheckShowMtDismiss
                    interval: 5000
                    running: true
                    onTriggered: checkShowMt.visible=false
                }
            }
        }
    }
    ListModel{
        id: eewListModel
    }
    Tab {
        id: tabEEW
        title: qsTr("EEW")
        ScrollView{
            anchors.fill: parent

            ListView{
                width: parent.width
                model: eewListModel
                delegate: cmpDelegate
                highlight: Rectangle{color: Qt.lighter("orange",1.75)}
                property bool isStation: false
            }
        }
    }
    ListModel{
        id: stationListModel
    }
    Tab {
        id: tabStation
        title: qsTr("Station")
        ScrollView{
            anchors.fill: parent

            ListView{
                width: parent.width
                model: stationListModel
                delegate: cmpDelegate
                highlight: Rectangle{color: Qt.lighter("lightskyblue",1.25)}
                property bool isStation: true
            }
        }
    }
    function _getTab(index){
        var tabs=[tabHistory,tabEEW,tabStation];
        return tabs[index];
    }
    function _getListModel(index){
        var models=[historyListModel,eewListModel,stationListModel];
        return models[index];
    }
    function clearTabItems(index){
        _getListModel(index).clear();
        scrollToTop(index);
    }
    function showTab(index){
        currentIndex=index;
    }
    function addTabItem(tabIndex,isHead){
        var model=_getListModel(tabIndex);
        model.append({
                         eqLocation: "Location",
                         eqTime: "0000-00-00 00:00:00",
                         eqMagnitude: 0.0,
                         eqStationData: "",
                         eqDepth: 0.0,
                         eqDistance: 0.0,
                         eqLongitude: 0.0,
                         eqLatitude: 0.0,
                         eqIntensity: 0.0,
                         eqLocalIntensity: 0.0,
                         eqTextColor: "",
                         eqBkColor: "",
                         eqIsHead: isHead||tabIndex===2
                     });
        return model.count-1;
    }
    function isItemExists(tabIndex,itemIndex){
        return _getListModel(tabIndex).count>itemIndex;
    }
    function setData(tabIndex,itemIndex,location,timeStr,magnitude,depth,longitude,latitude,distance){
        var item=_getListModel(tabIndex).get(itemIndex);
        item.eqLocation=location;
        item.eqTime=timeStr;
        item.eqMagnitude=magnitude;
        item.eqDepth=depth;
        item.eqLongitude=longitude;
        item.eqLatitude=latitude;
        item.eqDistance=distance;
    }
    function setIntensityColor(tabIndex,itemIndex,intensity,localInt,textColor,bkColor){
        var item=_getListModel(tabIndex).get(itemIndex);
        item.eqIntensity=intensity;
        item.eqLocalIntensity=localInt;
        item.eqTextColor=textColor;
        item.eqBkColor=bkColor;
    }

    function setStationData(tabIndex,itemIndex,location,timeStr,height,longitude,latitude,distance){
        var item=_getListModel(tabIndex).get(itemIndex);
        item.eqLocation=location;
        item.eqTime=timeStr;
        item.eqDepth=height;
        item.eqLongitude=longitude;
        item.eqLatitude=latitude;
        item.eqDistance=distance;
    }
    function setStationIntensity(tabIndex,itemIndex,intensity,textColor,bkColor,pga,pgv,pgd){
        var item=_getListModel(tabIndex).get(itemIndex);
        item.eqIntensity=intensity;
        item.eqTextColor=textColor;
        item.eqBkColor=bkColor;
        item.eqStationData="PGA: %1 gal\nPGV: %2 \u339D/s\nPGD: %3 \u339D".arg(pga).arg(pgv).arg(pgd);
    }

    function itemsCount(tabIndex){
        return _getListModel(tabIndex).count;
    }
    function removeItem(tabIndex,itemIndex){
        var model=_getListModel(tabIndex);
        model.remove(itemIndex);
    }
    function scrollToTop(tabIndex){
        var tab=_getTab(tabIndex);
        //Tab的实例化组件在item变量中
        //ScrollView的实例化组件在contentItem,flickableItem（Flickable类型，可控制滚动）变量中
        if(tab.item!==undefined&&tab.item!==null){
            tab.item.flickableItem.contentY=0;
        }
    }
    function resizeItems(tabIndex){
        //Nothing
    }

    property int languageIndex: 0
    function setLabelLanguage(language){
        languageIndex=language;
    }

    function monoFontName(){
        var fontName=["Sarasa Mono SC","Sarasa Mono SC","Sarasa Mono TC","Sarasa Mono J"];
        return fontName[languageIndex];
    }

    function propFontName(){
        var fontName=["Sarasa Gothic SC","Sarasa Gothic SC","Sarasa Gothic TC","Sarasa Gothic J"];
        return fontName[languageIndex];
    }
}
