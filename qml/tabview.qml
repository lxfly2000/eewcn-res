import QtQuick 2.14
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0

TabView {
    tabPosition: Qt.BottomEdge
    signal tabViewSetMapCenter(double lat,double lng)
    signal tabViewShowIntensity(double lat,double lng,double mag,double depth)
    //必须放在ScrollView外面
    ListModel{
        id: historyListModel
    }
    Tab {
        id: tabHistory
        title: qsTr("Records")

        ScrollView{
            anchors.fill: parent

            ListView{
                width: parent.width
                model: historyListModel
                delegate: Rectangle {
                    width: ListView.view.width
                    height: rowHistory.height
                    color: "transparent"
                    Row {
                        //参数：index
                        id: rowHistory
                        //注意文档中特别提到此处不能用parent
                        width: parent.width
                        topPadding: 1
                        bottomPadding: 1
                        Column {
                            width: parent.width-rectangleHistoryIntensity.width
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
                                    width: eqIsHead?parent.width:parent.width-textHistoryEqMagnitude.width
                                    wrapMode: Text.Wrap
                                    anchors.bottom: parent.bottom
                                }
                                Text {
                                    id: textHistoryEqMagnitude
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
                                    id: textHistoryHeadEqMagnitude
                                    text: "M"+eqMagnitude
                                    font.pointSize: 12
                                    font.family: propFontName()
                                }
                                Text {
                                    text: eqDepth+"km"
                                    font.pointSize: 12
                                    font.family: propFontName()
                                    width: parent.width-textHistoryHeadEqMagnitude.width
                                    anchors.bottom: parent.bottom
                                    horizontalAlignment: Text.AlignRight
                                }
                            }
                        }
                        Rectangle{
                            id: rectangleHistoryIntensity
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
                        onPressed: {
                            if(pressedButtons&Qt.LeftButton){
                                tabViewSetMapCenter(eqLatitude,eqLongitude);
                            }
                            if(pressedButtons&Qt.RightButton){
                                tabViewSetMapCenter(eqLatitude,eqLongitude);
                                contextHistoryMenu.popup()
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
                            id: contextHistoryMenu
                            MenuItem{
                                text: qsTr("View &Intensity on Map")
                                onTriggered: tabViewShowIntensity(eqLatitude,eqLongitude,eqMagnitude,eqDepth)
                            }
                        }
                    }
                    ToolTip.delay: 1000
                    ToolTip.timeout: 10000
                    ToolTip.visible: mouseEntered
                    ToolTip.text: qsTr("Time: %1\nLocation: %2\nLatitude: %3, Longitude: %4\nMagnitude: %5\nDepth: %6km\nDistance: %7km\nEpicenter Intensity: %8\nLocal Intensity: %9")
                    .arg(eqTime).arg(eqLocation).arg(eqLatitude).arg(eqLongitude).arg(eqMagnitude).arg(eqDepth).arg(eqDistance).arg(eqIntensity).arg(eqLocalIntensity)
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
                delegate: Rectangle {
                    width: ListView.view.width
                    height: rowEEW.height
                    color: "transparent"
                    Row {
                        //参数：index
                        id: rowEEW
                        //注意文档中特别提到此处不能用parent
                        width: parent.width
                        topPadding: 1
                        bottomPadding: 1
                        Column {
                            width: parent.width-rectangleEEWIntensity.width
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
                                    width: eqIsHead?parent.width:parent.width-textEEWEqMagnitude.width
                                    wrapMode: Text.Wrap
                                    anchors.bottom: parent.bottom
                                }
                                Text {
                                    id: textEEWEqMagnitude
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
                                    id: textEEWHeadEqMagnitude
                                    text: "M"+eqMagnitude
                                    font.pointSize: 12
                                    font.family: propFontName()
                                }
                                Text {
                                    text: eqDepth+"km"
                                    font.pointSize: 12
                                    font.family: propFontName()
                                    width: parent.width-textEEWHeadEqMagnitude.width
                                    anchors.bottom: parent.bottom
                                    horizontalAlignment: Text.AlignRight
                                }
                            }
                        }
                        Rectangle{
                            id: rectangleEEWIntensity
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
                        onPressed: {
                            if(pressedButtons&Qt.LeftButton){
                                tabViewSetMapCenter(eqLatitude,eqLongitude);
                            }
                            if(pressedButtons&Qt.RightButton){
                                tabViewSetMapCenter(eqLatitude,eqLongitude);
                                contextEEWMenu.popup()
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
                            id: contextEEWMenu
                            MenuItem{
                                text: qsTr("View &Intensity on Map")
                                onTriggered: tabViewShowIntensity(eqLatitude,eqLongitude,eqMagnitude,eqDepth)
                            }
                        }
                    }
                    ToolTip.delay: 1000
                    ToolTip.timeout: 10000
                    ToolTip.visible: mouseEntered
                    ToolTip.text: qsTr("Time: %1\nLocation: %2\nLatitude: %3, Longitude: %4\nMagnitude: %5\nDepth: %6km\nDistance: %7km\nEpicenter Intensity: %8\nLocal Intensity: %9")
                    .arg(eqTime).arg(eqLocation).arg(eqLatitude).arg(eqLongitude).arg(eqMagnitude).arg(eqDepth).arg(eqDistance).arg(eqIntensity).arg(eqLocalIntensity)
                }
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
        _getListModel(index).clear()
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
                         eqDepth: 0.0,
                         eqDistance: 0.0,
                         eqLongitude: 0.0,
                         eqLatitude: 0.0,
                         eqIntensity: 0.0,
                         eqLocalIntensity: 0.0,
                         eqTextColor: "",
                         eqBkColor: "",
                         eqIsHead: isHead
                     });
        //TODO:测站数据的处理
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

    function setStationData(tabIndex,itemIndex,location,timeStr,height,longitude,latitude,pga,pgv,pgd){
        //TODO
    }
    function setStationIntensity(tabIndex,itemIndex,intensity,textColor,bkColor){
        //TODO
    }

    function itemsCount(tabIndex){
        return _getListModel(tabIndex).count;
    }
    function removeItem(tabIndex,itemIndex){
        var model=_getListModel(tabIndex);
        model.remove(itemIndex);
    }
    function scrollToTop(tabIndex){
        //TODO
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
