import QtQuick 2.14
import QtQuick.Controls 1.4 as QControl1
import QtLocation 5.15
import QtPositioning 5.15
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1
import MapLibre 3.0


Item {
    visible: true
    function getWindowZoom(){
        return height/480;//假定初始QML窗口大小为640*480
    }
    //Windows, MacOS, Linux, Android, iOS
    property string runningOS: "Unknown"
    property string emptyGeoJson: '{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"MultiPolygon","coordinates":[]}}]}'

    Map {
        id: mapView
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(30.749113, 103.931691)
        zoomLevel: 3
        //copyrightsVisible: false
        onCopyrightLinkActivated: {
            //需要在信号名前加on才能处理信号
            Qt.openUrlExternally(link);
        }

        NumberAnimation {
            id: animMapLongitude
            target: mapView
            property: "center.longitude"
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            id:animMapLatitude
            target: mapView
            property: "center.latitude"
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            id:animMapZoomLevel
            target: mapView
            property: "zoomLevel"
            duration: 500
            easing.type: Easing.InOutQuad
        }

        Plugin {
            id: mapPlugin
            name: "maplibre"
            /*PluginParameter{
                id:mapboxAccessToken
                name: "mapboxgl.access_token"
                value: ""
            }
            PluginParameter{
                id:mapboxStyle
                name: "mapboxgl.mapping.additional_style_urls"
                //Qt自带的暗色模式URL为mapbox://styles/mapbox/dark-v9
                //自己在mapbox studio中创建的style用的是v11的模板，有些属性是不兼容的，需要手动修改
                value: ""
            }*/
            PluginParameter {
                id:maplibreStyle
                name: "maplibre.map.styles"
                value: ""
            }
        }

        MapLibre.style: Style {
            SourceParameter {
                id: mapIntensity1Source
                styleId: "intensity1Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity1Layer"
                type: "fill"
                property string source: "intensity1Source"
                paint: {"fill-color": getIntColors(1),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity2Source
                styleId: "intensity2Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity2Layer"
                type: "fill"
                property string source: "intensity2Source"
                paint: {"fill-color": getIntColors(2),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity3Source
                styleId: "intensity3Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity3Layer"
                type: "fill"
                property string source: "intensity3Source"
                paint: {"fill-color": getIntColors(3),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity4Source
                styleId: "intensity4Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity4Layer"
                type: "fill"
                property string source: "intensity4Source"
                paint: {"fill-color": getIntColors(4),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity5Source
                styleId: "intensity5Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity5Layer"
                type: "fill"
                property string source: "intensity5Source"
                paint: {"fill-color": getIntColors(5),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity6Source
                styleId: "intensity6Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity6Layer"
                type: "fill"
                property string source: "intensity6Source"
                paint: {"fill-color": getIntColors(6),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity7Source
                styleId: "intensity7Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity7Layer"
                type: "fill"
                property string source: "intensity7Source"
                paint: {"fill-color": getIntColors(7),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity8Source
                styleId: "intensity8Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity8Layer"
                type: "fill"
                property string source: "intensity8Source"
                paint: {"fill-color": getIntColors(8),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity9Source
                styleId: "intensity9Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity9Layer"
                type: "fill"
                property string source: "intensity9Source"
                paint: {"fill-color": getIntColors(9),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity10Source
                styleId: "intensity10Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity10Layer"
                type: "fill"
                property string source: "intensity10Source"
                paint: {"fill-color": getIntColors(10),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity11Source
                styleId: "intensity11Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity11Layer"
                type: "fill"
                property string source: "intensity11Source"
                paint: {"fill-color": getIntColors(11),"fill-opacity": 0.75}
            }
            SourceParameter {
                id: mapIntensity12Source
                styleId: "intensity12Source"
                type: "geojson"
                property string data: emptyGeoJson
            }
            LayerParameter {
                styleId: "intensity12Layer"
                type: "fill"
                property string source: "intensity12Source"
                paint: {"fill-color": getIntColors(12),"fill-opacity": 0.75}
            }
        }
    }

    //覆盖层的用法（可作为图层）：https://doc.qt.io/qt-5/location-plugin-itemsoverlay.html
    Map{
        id: supplementMapView
        visible: false
        anchors.fill: parent
        plugin: overlayPlugin
        center: QtPositioning.coordinate(30.749113, 103.931691)
        zoomLevel: 3
        Plugin{
            id:overlayPlugin
            name:"itemsoverlay"
        }
    }
    Map{
        id:yahooStationMarkMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }
    Map{
        id:estimateEpicenterMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
        //z:mapView.z+1//若不指定则按先后顺序确定Z序，代码中下面的在上面的上一层
    }
    Map{
        id:eewCircleMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
        //z:mapView.z+1//若不指定则按先后顺序确定Z序，代码中下面的在上面的上一层
    }
    Map{
        id:historyMarkMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }
    Map{
        id:homeMarkMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }
    Map{
        id:eewMarkMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }
    Map{
        id:stationMarkMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }
    Map{
        id:numberBarMapView
        anchors.fill: parent
        plugin: overlayPlugin
        gesture.enabled: false//禁用此图层的操作
        center: mapView.center//可直接绑定基本图层的中心
        color: "transparent"//背景透明
        minimumFieldOfView: mapView.minimumFieldOfView
        maximumFieldOfView: mapView.maximumFieldOfView
        minimumTilt: mapView.minimumTilt
        maximumTilt: mapView.maximumTilt
        minimumZoomLevel: mapView.minimumZoomLevel
        maximumZoomLevel: mapView.maximumZoomLevel
        zoomLevel: mapView.zoomLevel
        tilt: mapView.tilt;
        bearing: mapView.bearing
        fieldOfView: mapView.fieldOfView
    }

    Column {
        //id给js用，objectName给C++用，而且必须带引号
        id: columnLegends
        objectName: "columnLegends"
        spacing: 2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 2
        anchors.bottomMargin: 25
        scale: getWindowZoom()
        transformOrigin: Item.BottomLeft

        Row{
            spacing: 2
            Column{
                Text {
                    id: textLegendIntensity
                    text: qsTr("Intensity")
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                }
                Column{
                    id: columnLegendIntensities
                    Repeater {
                        model: 12
                        Row{
                            spacing: 2
                            Rectangle{
                                width: 20
                                height: 20
                                color: getIntColors(12-index)
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: (12-index).toString()
                                color: "white"
                                style: Text.Outline
                                font.pixelSize: 14
                                font.bold: true
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }

            Column{
                Text {
                    id: textLegendShindo
                    visible: checkShowNiedStations.checked
                    text: qsTr("Shindo")
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                }
                Column{
                    id: columnLegendShindos
                    visible: checkShowNiedStations.checked
                    Repeater {
                        model: 21
                        Row{
                            spacing: 2
                            Rectangle{
                                width: 20
                                height: 20*12/21
                                color: getYahooStationColor(20-index)
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: yahooStationShindoStr[20-index]
                                visible: index%2===0
                                height: 20*12/21
                                color: "white"
                                style: Text.Outline
                                font.pixelSize: 14
                                font.bold: true
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
        }

        Row{
            Column{
                Row {
                    spacing: 2
                    Image {
                        width: 20
                        height: 20
                        source: runningOS==="Android" ? "assets:Media/green.svg" : "file:Media/green.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        mipmap: true
                    }

                    Text {
                        id: textHome
                        color: "white"
                        text: qsTr("Home")
                        style: Text.Outline
                        font.pixelSize: 14
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    spacing: 2
                    Image {
                        width: 20
                        height: 20
                        source: runningOS==="Android" ? "assets:Media/red.svg" : "file:Media/red.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        mipmap: true
                    }

                    Text {
                        id: textRed
                        color: "white"
                        text: qsTr("Earthquake Record")
                        style: Text.Outline
                        font.pixelSize: 14
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    spacing: 2
                    Image {
                        width: 20
                        height: 20
                        source: runningOS==="Android" ? "assets:Media/cross.svg" : "file:Media/cross.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        mipmap: true
                    }

                    Text {
                        id: textCross
                        color: "white"
                        text: qsTr("EEW Record")
                        style: Text.Outline
                        font.pixelSize: 14
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            Column{
                id: legendPSWave
                visible: false
                anchors.bottom: parent.bottom
                Row{
                    spacing: 2
                    Rectangle{
                        width: 20
                        height: 20
                        color: "transparent"
                        radius: 10
                        border.color: "white"
                        border.width: 1
                    }
                    Text {
                        id: textLegendPWave
                        text: qsTr("P Wave")
                        color: "white"
                        style: Text.Outline
                        font.pixelSize: 14
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Row{
                    spacing: 2
                    Row{
                        id: columnSWaveLegends
                        Repeater {
                            model: 12
                            Rectangle{
                                width: 20
                                height: 20
                                radius: 10
                                color: 'transparent'
                                border.color: getIntLineColor(index+1)
                                border.width: 1
                                RadialGradient {
                                    anchors.fill: parent
                                    gradient: Gradient {
                                        GradientStop { position: 0.0; color: "transparent" }
                                        GradientStop { position: 0.25; color: "transparent" }
                                        GradientStop { position: 0.49609375; color: '#55'+getIntColors(index+1).substr(1) }
                                        GradientStop { position: 0.5; color: "transparent" }
                                    }
                                }
                            }
                        }
                    }
                    Text {
                        id: textLegendSWave
                        text: qsTr("S Wave")
                        color: "white"
                        style: Text.Outline
                        font.pixelSize: 14
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            Row{
                id: legendEstimateEpicenter
                visible: false
                anchors.bottom: parent.bottom
                spacing: 2
                Image{
                    width: 20
                    height: 20
                    source: uriSvgEstimateEpicenter
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    mipmap: true
                }
                Text{
                    text: qsTr("Estimated Epicenter")
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: textLegendSWave.font.family
                }
            }
        }
    }

    Column{
        id: columnHeads
        //visible: false
        x: 2
        y: 2
        spacing: 1
        transformOrigin: Item.TopLeft
        scale: getWindowZoom()
        /*RectangeHead*/
    }

    Column{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 5
        anchors.bottomMargin: 2
        spacing: 1
        transformOrigin: Item.BottomRight
        scale: getWindowZoom()

        Column {
            id: columnCounter
            visible: false
            anchors.right: parent.right

            Text {
                id: textSwaveArrivingIn
                color: "#ffffff"
                text: qsTr("S Wave arriving in…")
                font.bold: true
                style: Text.Outline
                anchors.right: parent.right
                font.pixelSize: 14
            }

            Column{
                id: columnListCounters
                spacing: 1
                /*ColumnListCounters*/
            }
        }

        Row {
            spacing: 12
            anchors.right: parent.right
            Text {
                id: textEEWTime
                color: "red"
                text: "0000-00-00 00:00:00"
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
            }
            Text {
                id: textNIEDTime
                visible: checkShowNiedStations.checked
                color: "red"
                text: "NIED: 00:00:00"
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
            }
        }
    }

    Text {
        id: debugText
        objectName: "debugText"
        color: "#ffffff"
        text: "Text"
        style: Text.Outline
        font.pixelSize: 18
    }

    Rectangle{
        id: rcNIEDPlayback
        visible: false
        anchors.centerIn: parent
        color: "white"
        border.color: "black"
        border.width: 2
        width: columnRcNIEDPlayback.width
        height: columnRcNIEDPlayback.height
        Column{
            id: columnRcNIEDPlayback
            padding: 5
            Text {
                text: qsTr("Enter Time:")
            }
            QControl1.TextField{
                id: inputNIEDPlaybackTime
                width: 300
                placeholderText: "YYYY-MM-DD HH:MM:SS"
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                QControl1.Button{
                    text: qsTr("&OK")
                    onClicked: {
                        setNIEDPlaybackTime(inputNIEDPlaybackTime.text);
                        rcNIEDPlayback.visible=false;
                    }
                }
                QControl1.Button{
                    text: qsTr("&Cancel")
                    onClicked: rcNIEDPlayback.visible=false
                }
                QControl1.Button{
                    text: qsTr("&Reset")
                    onClicked: {
                        inputNIEDPlaybackTime.text="";
                        setNIEDPlaybackTime(inputNIEDPlaybackTime.text);
                        rcNIEDPlayback.visible=false;
                    }
                }
            }
        }
    }

    function setNIEDPlaybackTime(chineseFormatDateTimeStr){
        if(chineseFormatDateTimeStr===""){
            yahooPlaybackDeltaSec=0;
        }else{
            yahooPlaybackDeltaSec=Math.floor((Date.now()-new Date(chineseFormatDateTimeStr).getTime())/1000);
        }
        yahooStationRealtimeDataTimestampSec=0;
        yahooStationRealtimeData=[];
    }

    function getMaxShindo(){
        var index=stationIndexSortByShindo[0];
        if(index===undefined)
            return -1;
        var shindo=yahooStationQMLItem[index].shindo;
        if(shindo===undefined)
            return -1;
        return shindo;
    }

    Row{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 8
        anchors.topMargin: 8
        transformOrigin: Item.TopRight
        scale: getWindowZoom()
        spacing: 2
        Text {
            text: qsTr("NIED Max Shindo")
            visible: checkShowNiedStations.checked
            font.bold: true
            font.family: textEEWTime.font.family
            font.pixelSize: 14
            color: "white"
            style: Text.Outline
            anchors.verticalCenter: buttonMenu.verticalCenter
        }
        Rectangle{
            id: rcMaxShindoIndicator
            property var maxShindo: -1
            visible: checkShowNiedStations.checked
            width: 30
            height: 20
            color: getYahooStationColor(maxShindo)
            Text {
                text: yahooStationShindoStr[parent.maxShindo]
                font.bold: true
                font.family: textEEWTime.font.family
                font.pixelSize: 14
                color: getYahooStationTextColor(parent.maxShindo)
                anchors.centerIn: parent
            }
        }
        Button{
            id: buttonMenu
            width: 20
            height: 20
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.color: "white"
                border.width: 2
                radius: 2
                Image{
                    anchors.fill: parent
                    source: 'menubtn.svg'
                    mipmap: true
                }
            }
            onClicked: mapviewMenu.popup()
        }
        Menu{
            id: mapviewMenu
            width: 300
            MenuItem{
                id: checkLockView
                checkable: true
                checked: false
                text: qsTr("&Lock View")
                ToolTip.delay: 1000
                ToolTip.timeout: 10000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Prevent the program from getting stuck.")
                Settings{
                    property alias lockView: checkLockView.checked
                }
            }
            MenuItem{
                id: checkNoAnimation
                checkable: true
                checked: false
                text: qsTr("&No Animation")
                ToolTip.delay: 1000
                ToolTip.timeout: 10000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("May relieve the program getting stuck.")
                Settings{
                    property alias noAnimation: checkNoAnimation.checked
                }
            }
            MenuItem{
                id: checkOldEewHead
                checkable: true
                checked: false
                text: qsTr("&Old EEW Head")
                Settings{
                    property alias oldEewHead: checkOldEewHead.checked
                }
            }
            MenuItem{
                id: checkShowNiedStations
                checkable: true
                checked: true
                text: qsTr("Show &NIED Stations")
                Settings{
                    property alias showNiedStations: checkShowNiedStations.checked
                }
                onClicked: {
                    if(checkShowNiedStations.checked){
                        initNiedStation();
                    }else{
                        releaseNiedStation();
                    }
                }
            }
            MenuItem{
                id: checkEstimateEpicenter
                checkable: true
                checked: true
                enabled: checkShowNiedStations.checked
                text: qsTr("&Estimate Epicenter")
                ToolTip.delay: 1000
                ToolTip.timeout: 10000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Low precision.")
                Settings{
                    property alias estimateShindo: checkEstimateEpicenter.checked
                }
            }
            MenuItem{
                text: qsTr("NIED Station &Playback")
                onClicked: rcNIEDPlayback.visible=true
                enabled: checkShowNiedStations.checked
            }
            MenuItem{
                text: qsTr("&Help")
                onClicked: Qt.openUrlExternally("https://lxfly2000.github.io/eewcn-res/link.htm?key=EEWCNHelp")
            }
        }
        Rectangle{
            id:rectWarnInfo
            width: columnWarnInfo.width
            height: columnWarnInfo.height
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "#FF1240AB" }
                    GradientStop { position: 1.0; color: "#6D6C8CD5" }
                }
            Column{
                id:columnWarnInfo
                leftPadding: 20
                rightPadding: 20
                topPadding: 8
                bottomPadding: 8
                Text {
                    id: textWarnInfoTitle
                    text: "WarnInfo"
                    font.pixelSize: 48
                    font.bold: true
                    color: "yellow"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: textWarnInfoContent
                    text: "Details"
                    font.pixelSize: 24
                    font.bold: true
                    color: "yellow"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("https://lxfly2000.github.io/eewcn-res/link.htm?key=WarningHelp");
                    parent.visible=false;
                }
            }
        }
    }

    function loadLocalSettings(){
        var db=LocalStorage.openDatabaseSync("eewcndb","1.0","EEW CN MapView Database",10000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mapviewtbl(sKey TEXT UNIQUE, sValue TEXT)');
            var rs=tx.executeSql('SELECT sValue FROM mapviewtbl WHERE sKey=?',["lockview"]);
            if(rs.rows.length>0){
                checkLockView.checked=(rs.rows.item(0).sValue==="true");
            }
            rs=tx.executeSql('SELECT sValue FROM mapviewtbl WHERE sKey=?',["noanimation"]);
            if(rs.rows.length>0){
                checkNoAnimation.checked=(rs.rows.item(0).sValue==="true");
            }
        });
    }

    function saveLocalSettings(){
        var db=LocalStorage.openDatabaseSync("eewcndb","1.0","EEW CN MapView Database",10000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mapviewtbl(sKey TEXT UNIQUE, sValue TEXT)');
            tx.executeSql('INSERT OR REPLACE INTO mapviewtbl VALUES(?,?)',["lockview",checkLockView.checked.toString()]);
            tx.executeSql('INSERT OR REPLACE INTO mapviewtbl VALUES(?,?)',["noanimation",checkNoAnimation.checked.toString()]);
        });
    }

    function setShowWarnInfo(bShow,title,msg){
        rectWarnInfo.visible=bShow;
        textWarnInfoTitle.text=title;
        textWarnInfoContent.text=msg;
    }

    Timer{
        id: eewMarksTimer
        interval: 500
        repeat: true
        onTriggered: {
            for(var key in pwaveItems){
                if(eewItems[key]!==undefined){
                    eewItems[key].visible=itemVisible;
                }
                if(Object.keys(numberItems).length>1){
                    numberItems[key].visible=itemVisible;
                }
            }
            itemVisible=!itemVisible;
        }
        property bool itemVisible: false
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        property real lastNIEDTimeSec:0
        onTriggered: {
            if(Date.now()-msEEWTime>5000){
                textEEWTime.color="red";
            }
            if(checkShowNiedStations.checked){
                if(Date.now()-yahooStationRealtimeDataTimestampSec*1000>5000){
                    textNIEDTime.color="red";
                    if(lastNIEDTimeSec!==yahooStationRealtimeDataTimestampSec&&yahooStationQueryAccumulatedDelaySec>0&&yahooPlaybackDeltaSec===0){
                        yahooStationQueryAccumulatedDelaySec--;
                    }
                }
                lastNIEDTimeSec=yahooStationRealtimeDataTimestampSec;
            }
        }
    }


    property var homeItem: null
    property var eewItems: ({})
    property var historyItems: []
    property var pwaveItems: ({})
    property var swaveItems: ({})
    property var barItems: ({})
    property var numberItems: ({})
    property var swaveIntensities: ({})
    property var stationItems: []

    Rectangle{
        id:rectangleWarnInfoCenter
        visible:true
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.verticalCenter:parent.verticalCenter
        width:textWarnInfoCenter.width
        height:textWarnInfoCenter.height
        color:"#993f3f3f"
        Text{
            id:textWarnInfoCenter
            leftPadding:20
            rightPadding:20
            topPadding:8
            bottomPadding:8
            text:"WarnInfoCenter"
            font.pixelSize:24*getWindowZoom()
            font.bold:true
            font.family:textWarnInfoContent.font.family;color:"yellow"
            style:Text.Outline
            anchors.horizontalCenter:parent.horizontalCenter
            wrapMode:Text.Wrap
            width:Math.min(textWarnInfoCenter2.width,parent.parent.width)
        }
        Text{
            id:textWarnInfoCenter2
            leftPadding:20
            rightPadding:20
            topPadding:8
            bottomPadding:8
            text:textWarnInfoCenter.text
            font.pixelSize:24*getWindowZoom()
            font.bold:true
            font.family:textWarnInfoCenter.font.family
            style:Text.Outline
            anchors.horizontalCenter:parent.horizontalCenter
            visible:false
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally("https://lxfly2000.github.io/eewcn-res/link.htm?key=WarningHelp");
                parent.visible=false;
            }
        }
    }

    function showWarningCenter(bVisible,sText){
        rectangleWarnInfoCenter.visible=bVisible;
        textWarnInfoCenter.text=sText;
    }

    function setMapboxParam(a,s){
        if(a==="pk.eyJ1IjoibHhmbHkyMDAwIiwiYSI6ImNrcHMwenM2ZzAyeWUydXM0dWE5aGs0cjgifQ.h_6WnVVn5tltXvJRI8BK1g"&&s.startsWith("mapbox:")){
            //未设置，使用自带的样式
            a="pk.eyJ1IjoibHhmbHkyMDAwIiwiYSI6ImNtNjlkdWZ2ZDA5N2cya3F1OGw2b3ZseDkifQ.LpSPrjVvQwUAOgfrzaVAqg";
            //https://docs.mapbox.com/api/maps/styles/#retrieve-a-style
            _convertMapboxStyle("https://api.mapbox.com/styles/v1/"+s.substr(s.indexOf("/styles/")+8)+"?access_token="+a,true);
        }else if(s.startsWith("mapbox:")){
            //用户设置使用自己的Mapbox样式
            _convertMapboxStyle("https://api.mapbox.com/styles/v1/"+s.substr(s.indexOf("/styles/")+8)+"?access_token="+a,false);
        }else{
            //用户设置使用自己的JSON样式
            maplibreStyle.value=s;
            showWarningCenter(false,"");
        }
        if(checkShowNiedStations.checked){
            initNiedStation();
        }
    }

    //{"items": [{"data_type_name": "KiK-net", "sitecode": "ABSH01", "sitename_j": "\u96c4\u6b66", "prefname": "\u5317\u6d77\u9053", "note": "", "sitename_e": "OMU", "lat_jgd": "44.5276", "lon_jgd": "142.8444", "elevation": "105", "depth": "100", "loggertype_name": "KiK-net18"},...]}
    //经纬度单位为度，高程和深度单位为米
    property string niedStationPubUrl: "https://lxfly2000.github.io/eewcn-res/qml/stationdata/nied.json"
    //{"siteConfigId":"20260123000000","items":[[35.3,136.8],...],"copyright":["National Research Institute for Earth Science and Disaster Resilience","LY Corporation"],"version":"1.0"}
    property string yahooStationListUrl: "https://weather-kyoshin.east.edge.storage-yahoo.jp/SiteList/sitelist.json"
    //{"realTimeData":{"dataTime":"2026-04-18T21:03:34+09:00","siteConfigId":"20260123000000","intensity":"..."},"psWave":null,"hypoInfo":null,"estShindo":null,"copyright":["National Research Institute for Earth Science and Disaster Resilience","LY Corporation"],"version":"2.0"}
    //intensity:用字母表示的震度，将每个字符转换为ASCII码并减100得到雅虎自己的震度值，值的范围为0-20，对应NIED的震度为-3-7
    //参考：https://qiita.com/Starryacat/items/0101aa2ba4b8cb91daa1
    property string yahooStationDataUrlTemplate: "https://weather-kyoshin.east.edge.storage-yahoo.jp/RealTimeData/{yyyy}{mm}{dd}/{yyyy}{mm}{dd}{hh}{mm}{ss}.json"
    //{siteConfigId:"...",items:[{lat:...,lon:...,name:...,elevation:...(m),depth:...(m)},...]}
    property var detailedYahooStationData: ({})
    property var niedStationData: ({})
    //二维数组，存储雅虎震度数据，用0-20表示，-1表示当前时间没有数据
    //[[测站1数据], [测站2数据], ...]
    property var yahooStationRealtimeData: []
    //每个测站存储最近的30条数据，超过30条则删除最早的数据
    property var yahooStationRealtimeDataMaxLength: 300
    property var yahooStationRealtimeDataTimestampSec: 0
    property var yahooStationQueryIntervalSec: 1
    property var yahooStationQueryAccumulatedDelaySec: 0
    property var yahooStationQMLItem: []
    property var yahooStationShindoStr: [
        "-3", "-2.5", "-2", "-1.5", "-1", "-0.5", "0", "0.5",
        "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5",
        "5", "5.5", "6", "6.5", "7"
    ]
    property var yahooPlaybackDeltaSec: 0
    property var stationIndexGrid: [] //测站按[整数纬度+90][整数经度+180][测站列表]划分的索引阵列
    property var stationIndexSortByShindo: [] //测站索引按震度大到小排序
    property var gridsThatHaveStationLatLng: null //有测站的格子（不重复的集合，(整数纬度+90)*65536+(整数经度+180)）
    property var uriSvgEstimateEpicenter: 'estepi.svg'
    property var yahooStationMinDetectShindo: 7

    function rearrangeStationIndexGrid(){
        stationIndexGrid=[];
        gridsThatHaveStationLatLng=new Set();
        for(var i=0;i<detailedYahooStationData.items.length;i++){
            var item=detailedYahooStationData.items[i];
            var indexLat=Math.floor(item.lat+90);
            var indexLon=Math.floor(item.lon+180);
            if(stationIndexGrid[indexLat]===undefined){
                stationIndexGrid[indexLat]=[];
            }
            if(stationIndexGrid[indexLat][indexLon]===undefined){
                stationIndexGrid[indexLat][indexLon]=[];
            }
            stationIndexGrid[indexLat][indexLon].push(i);
            gridsThatHaveStationLatLng.add(indexLat*65536+indexLon);
        }
    }

    function getStationIndexListFromGrid(latitude,longitude){
        var indexLat=Math.floor(latitude+90);
        var indexLon=Math.floor(longitude+180);
        return stationIndexGrid[indexLat]&&stationIndexGrid[indexLat][indexLon];
    }

    //num:数值
    function _yahooRound(num) {
        return Math.round(num * 10) / 10;
    }

    function _yahooNumIntFromChar(numChar) {
        return numChar.charCodeAt(0) - 100;
    }
    
    Timer{
        id: yahooStationDataTimer
        interval: yahooStationQueryIntervalSec * 1000
        repeat: false
        running: false
        onTriggered: getYahooStationData()
    }

    function _loadYahooStation(){
        var xhr=new XMLHttpRequest();
        xhr.open("GET",yahooStationListUrl,true);
        xhr.onreadystatechange=function(){
            if(xhr.readyState===4&&xhr.status===200){
                var data=JSON.parse(xhr.responseText);
                detailedYahooStationData={siteConfigId: data.siteConfigId, items: []};
                var niedPos=0;//开始查找的位置
                for(var i=0;i<data.items.length;i++){
                    var item=data.items[i];//[lat,lon,...]
                    //逐个匹配NIED的站点
                    var niedSearchPos=niedPos;//当前查找的位置
                    const maxSearchCount=10;
                    var found=false;
                    while(niedSearchPos<niedPos+maxSearchCount&&niedSearchPos<niedStationData.items.length){
                        var niedItem=niedStationData.items[niedSearchPos];
                        if(_yahooRound(parseFloat(niedItem.lat_jgd))===item[0]&&_yahooRound(parseFloat(niedItem.lon_jgd))===item[1]){
                            //认为匹配成功，记录数据并跳出循环
                            detailedYahooStationData.items.push({
                                lat: parseFloat(niedItem.lat_jgd),
                                lon: parseFloat(niedItem.lon_jgd),
                                name: niedItem.sitename_j,
                                elevation: parseFloat(niedItem.elevation),
                                depth: parseFloat(niedItem.depth)
                            });
                            found=true;
                            niedSearchPos++;//下一次从下一个位置开始查找
                            break;
                        }
                        niedSearchPos++;
                    }
                    if(found){
                        niedPos=niedSearchPos;//下一次从这里开始查找
                    }else{
                        //未找到匹配的NIED站点，记录部分数据
                        detailedYahooStationData.items.push({
                            lat: item[0],
                            lon: item[1],
                            name: "",
                            elevation: 0,
                            depth: 0
                        });
                    }
                }
                stationIndexSortByShindo=[];
                for(i=0;i<detailedYahooStationData.items.length;i++){
                    stationIndexSortByShindo.push(i);
                }
                _recreateYahooStationQMLItem();
                rearrangeStationIndexGrid();
                yahooStationDataTimer.start();
            }
        };
        xhr.send();
    }

    function _recreateYahooStationQMLItem(){
        //销毁旧的Item
        for(var i=0;i<yahooStationQMLItem.length;i++){
            yahooStationQMLItem[i].destroy();
        }
        yahooStationQMLItem=[];
        //创建新的Item
        for(var i=0;i<detailedYahooStationData.items.length;i++){
            var itemData=detailedYahooStationData.items[i];
            var item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                'MapQuickItem {property var shindo:-1;z:shindo;sourceItem:Rectangle{id:dot;width:5+Math.max(0,mapView.zoomLevel-8)*5;height:width;'+
                'color:getYahooStationColor(shindo);radius:width/2;anchors.centerIn:parent;'+
                'Text{text:"'+itemData.name+':"+yahooStationShindoStr[shindo];font.family:textEEWTime.font.family;font.pixelSize:14;font.bold:true;'+
                'style:Text.Outline;color:"white";anchors.horizontalCenter:parent.horizontalCenter;anchors.top:parent.bottom;'+
                'visible:mapView.zoomLevel>=9&&parent.color.a>0}}}',yahooStationMarkMapView);
            item.coordinate=QtPositioning.coordinate(itemData.lat,itemData.lon);
            yahooStationMarkMapView.addMapItem(item);
            yahooStationQMLItem.push(item);
        }
    }

    function initNiedStation(){
        var xhr=new XMLHttpRequest();
        xhr.open("GET",niedStationPubUrl,true);
        xhr.onreadystatechange=function(){
            if(xhr.readyState===4&&xhr.status===200){
                niedStationData=JSON.parse(xhr.responseText);
                niedStationData.items.sort(function(a,b){
                    if(a.data_type_name<b.data_type_name){
                        return -1;
                    }else if(a.data_type_name>b.data_type_name){
                        return 1;
                    }else if(a.sitecode<b.sitecode){
                        return -1;
                    }else if(a.sitecode>b.sitecode){
                        return 1;
                    }else{
                        return 0;
                    }
                });
                _loadYahooStation();
            }
        };
        xhr.send();
    }

    function releaseNiedStation(){
        niedStationData={};
        detailedYahooStationData={};
        yahooStationRealtimeData=[];
        yahooStationRealtimeDataTimestampSec=0;
        yahooStationDataTimer.stop();
        for(var i=0;i<yahooStationQMLItem.length;i++){
            yahooStationMarkMapView.removeMapItem(yahooStationQMLItem[i]);
            yahooStationQMLItem[i].destroy();
        }
        yahooStationQMLItem=[];
    }

    function getYahooStationColor(intensity){
        if(intensity<0||intensity>20){
            return "transparent";
        }else{
            const colors=["#97b7cc","#90b3ca","#89afc8","#71a2cb","#5ea7ac",
                "#38a477","#0fb02b","#f4e200","#fbc300","#ffaf00",
                "#f90","#ff7e00","#ff6200","#fc4c02","#f53605",
                "#f11520","#ed0047","#e30071","#dc009c","#c900ba",
                "#b600d7"];
            return colors[intensity];
        }
    }

    function getYahooStationTextColor(intensity){
        if(intensity<0||intensity>20){
            return "black";
        }
        const colors=["black","black","black","white","white",
                      "white","white","black","black","black",
                      "black","white","white","white","white",
                      "white","white","white","white","white",
                      "white"];
        return colors[intensity];
    }

    //获取实时数据
    function getYahooStationData(){
        if(detailedYahooStationData.siteConfigId===undefined){
            //尚未加载到站点列表，无法获取数据
            yahooStationDataTimer.start();
            return;
        }
        var now=new Date();
        now.setSeconds(now.getSeconds()-yahooStationQueryAccumulatedDelaySec-yahooPlaybackDeltaSec);
        //使用UTC+9时区
        now.setUTCHours(now.getUTCHours()+9);
        var yyyy=now.getUTCFullYear().toString();
        var mm=(now.getUTCMonth()+1).toString().padStart(2,"0");
        var dd=now.getUTCDate().toString().padStart(2,"0");
        var hh=now.getUTCHours().toString().padStart(2,"0");
        var min=now.getUTCMinutes().toString().padStart(2,"0");
        var ss=now.getUTCSeconds().toString().padStart(2,"0");
        var url=yahooStationDataUrlTemplate.replace("{yyyy}",yyyy)
        .replace("{mm}",mm)
        .replace("{dd}",dd)
        .replace("{yyyy}",yyyy)
        .replace("{mm}",mm)
        .replace("{dd}",dd)
        .replace("{hh}",hh)
        .replace("{mm}",min)
        .replace("{ss}",ss);
        var xhr=new XMLHttpRequest();
        xhr.open("GET",url,true);
        xhr.onreadystatechange=function(){
            if(xhr.readyState===4&&xhr.status===200){
                var data=JSON.parse(xhr.responseText);
                if(data.realTimeData.siteConfigId!==detailedYahooStationData.siteConfigId){
                    //站点列表发生变化，重新加载
                    _loadYahooStation();
                }else if(data.realTimeData!==null){
                    var tsSec=Math.floor(new Date(data.realTimeData.dataTime).getTime()/1000);
                    var delayCount=yahooStationRealtimeDataTimestampSec===0?0:Math.round((tsSec-yahooStationRealtimeDataTimestampSec)/yahooStationQueryIntervalSec-1);
                    yahooStationRealtimeDataTimestampSec=tsSec;
                    var intensityStr=data.realTimeData.intensity;
                    var stationIntensityList=intensityStr.split("");
                    for(var i=0;i<stationIntensityList.length;i++){
                        if(yahooStationRealtimeData[i]===undefined){
                            yahooStationRealtimeData[i]=[];
                        }
                        // 根据delayCount填充数据
                        for(var j=0;j<delayCount;j++){
                            yahooStationRealtimeData[i].push(-1);
                        }
                        var yahooInt=_yahooNumIntFromChar(stationIntensityList[i]);
                        yahooStationRealtimeData[i].push(yahooInt);
                        // 限制数据长度
                        while(yahooStationRealtimeData[i].length > yahooStationRealtimeDataMaxLength){
                            yahooStationRealtimeData[i].shift();
                        }
                        yahooStationQMLItem[i].shindo=yahooInt; //根据震度调整显示层级，震度越大越靠上
                    }
                    stationIndexSortByShindo.sort(function(a,b){
                        return yahooStationQMLItem[b].shindo-yahooStationQMLItem[a].shindo;
                    });
                    rcMaxShindoIndicator.maxShindo=getMaxShindo();
                    updateNIEDTime(yahooStationRealtimeDataTimestampSec);
                    if(checkShowNiedStations.checked&&checkEstimateEpicenter.checked)
                        estimateEpicenter();
                    yahooStationDataTimer.start();
                }
            }else{
                if(xhr.readyState===4&&xhr.status===403){
                    yahooStationQueryAccumulatedDelaySec+=1;
                }
                yahooStationDataTimer.start();
            }
        };
        xhr.send();
    }

    Loader {
        id: travelTimeLoader
        source: "TravelTime.qml"
    }

    function getTravelTimeObject(){
        return travelTimeLoader.children[0];
    }

    function calcSurfaceDistanceKm(lat1,lon1,lat2,lon2){
        var c1=QtPositioning.coordinate(lat1,lon1);
        var c2=QtPositioning.coordinate(lat2,lon2);
        return c1.distanceTo(c2)/1000;
    }

    function limitLon(noLimitLon){
        while(noLimitLon>180)
            noLimitLon-=360;
        while(noLimitLon<-180)
            noLimitLon+=360;
        return noLimitLon;
    }

    function hasDetectedStationInIndexList(indexList,stationsEarliestDetectedTimeSec){
        for(var i of indexList){
            if(stationsEarliestDetectedTimeSec[i]!==undefined)
                return true;
        }
        return false;
    }

    //lat,lon:假设震源的位置, earliestLat,earliestLon:最早检测到的测站的位置
    function _calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,earliestLat,earliestLon,lat,lon,depth){
        var earliestStationDistanceToEpi=calcSurfaceDistanceKm(lat,lon,earliestLat,earliestLon);
        var stationsEstimatedQuakeTimeSec=[];//各测站反推的发震时刻
        var stationsWeight=[];//各测站的权重
        var avgEstimatedQuakeTimeSec=0;//平均发生时间
        var maxDistanceToEpi=0;//距震中最远的检出测站
        for(var i=0;i<stationsEarliestDetectedTimeSec.length;i++){
            if(stationsEarliestDetectedTimeSec[i]!==undefined){
                //假设深度是10km
                var tt=getTravelTimeObject().getTravelTimeToSurfaceDistanceByTable(0,depth,calcSurfaceDistanceKm(lat,lon,
                    detailedYahooStationData.items[i].lat,detailedYahooStationData.items[i].lon));
                stationsEstimatedQuakeTimeSec[i]=stationsEarliestDetectedTimeSec[i]-tt;
                avgEstimatedQuakeTimeSec+=stationsEstimatedQuakeTimeSec[i];
                //当前测站震中距
                var distanceToEpi=calcSurfaceDistanceKm(lat,lon,
                    detailedYahooStationData.items[i].lat,detailedYahooStationData.items[i].lon)
                maxDistanceToEpi=Math.max(maxDistanceToEpi,distanceToEpi);
                stationsWeight[i]=(distanceToEpi<50)?1:(earliestStationDistanceToEpi/distanceToEpi);
            }
        }
        avgEstimatedQuakeTimeSec=avgEstimatedQuakeTimeSec/countStationsDetected;
        var variance=0;
        for(i=0;i<stationsEstimatedQuakeTimeSec.length;i++){
            if(stationsEstimatedQuakeTimeSec[i]!==undefined){
                var d=stationsEstimatedQuakeTimeSec[i]-avgEstimatedQuakeTimeSec;//时间差
                variance+=stationsWeight[i]*d*d;
            }
        }
        //记录方差
        if(varianceAtLatLngDepth[lat]===undefined)
            varianceAtLatLngDepth[lat]={};
        if(varianceAtLatLngDepth[lat][lon]===undefined)
            varianceAtLatLngDepth[lat][lon]={};
        varianceAtLatLngDepth[lat][lon][depth]={d:variance,t:avgEstimatedQuakeTimeSec};
        //着未着法：检测3秒内或10秒内30点未满时：
        //检测站周围格子内，最大震中距（离这个假设震源距离最大的检出测站）+30km内选取未检知点，计算震中距和走时（到达所需时间）
        //推测发震平均时间加上走时，得到到达时间
        //若到达时间小于现在时间（也就是计算上应该已经到达的），误差+1
        if(yahooStationRealtimeDataTimestampSec<stationsEarliestDetectedTimeSec+3||
                (yahooStationRealtimeDataTimestampSec<stationsEarliestDetectedTimeSec+10&&countStationsDetected<30)){
            for(i=0;i<detailedYahooStationData.items.length;i++){
                distanceToEpi=calcSurfaceDistanceKm(lat,lon,detailedYahooStationData.items[i].lat,detailedYahooStationData.items[i].lon);
                if(stationsEarliestDetectedTimeSec[i]===undefined&&maxDistanceToEpi+30>distanceToEpi){//未检测到的
                    //周围格子是否有已检出
                    var iDown=getStationIndexListFromGrid(detailedYahooStationData.items[i].lat-1,detailedYahooStationData.items[i].lon);
                    var iUp=getStationIndexListFromGrid(detailedYahooStationData.items[i].lat+1,detailedYahooStationData.items[i].lon);
                    var iLeft=getStationIndexListFromGrid(detailedYahooStationData.items[i].lat,limitLon(detailedYahooStationData.items[i].lon-1));
                    var iRight=getStationIndexListFromGrid(detailedYahooStationData.items[i].lat,limitLon(detailedYahooStationData.items[i].lon+1));
                    if(hasDetectedStationInIndexList(iDown||[],stationsEarliestDetectedTimeSec)||
                            hasDetectedStationInIndexList(iUp||[],stationsEarliestDetectedTimeSec)||
                            hasDetectedStationInIndexList(iLeft||[],stationsEarliestDetectedTimeSec)||
                            hasDetectedStationInIndexList(iRight||[],stationsEarliestDetectedTimeSec)){
                        if(getTravelTimeObject().getTravelTimeToSurfaceDistanceByTable(0,depth,distanceToEpi)+avgEstimatedQuakeTimeSec<yahooStationRealtimeDataTimestampSec)
                            varianceAtLatLngDepth[lat][lon][depth].d+=1;
                    }
                }
            }
        }
        return variance;
    }

    function calcLineDis(dep, dis){
        const r = 6371;
        const theta = dis / r;
        const a = r - dep;
        const lineDis = Math.sqrt(a * a + r * r - 2 * a * r * Math.cos(theta));
        return lineDis;
    }

    function calcJmaShindo(mj, dep, hypoLat, hypoLng, atLocLat,atLocLng){
        const mw = mj - 0.171;
        const lo = Math.pow(10, 0.5 * mw - 1.85) / 2;
        const surfaceDist = calcSurfaceDistanceKm(hypoLat,hypoLng,atLocLat,atLocLng);
        const lineDis = calcLineDis(dep, surfaceDist);
        const hypoDist = lineDis - lo;
        const x = Math.max(hypoDist, 3);
        const pgv600 = Math.pow(10, (0.58 * mw + 0.0038 * dep - 1.29 - Math.log10(x + 0.0028 * Math.pow(10, 0.5 * mw)) - 0.002 * x));
        const arv = 1.0;//Number(loc.arv); //不考虑地表增幅
        const pgv400 = pgv600 * 1.307;
        const pgv = pgv400 * arv;
        const instShindo = 2.68 + 1.72 * Math.log10(pgv);
        return instShindo;
    }

    function calcEstimateMagnitude(epiLat,epiLon,epiDepth,atLat,atLon,atDepth,yahooShindo){
        //暂时不考虑测站的高度或深度atDepth
        var niedShindo=yahooShindo/2-3;
        //不清楚算法时采用遍历方法
        var closestError=2147483647;
        var closestM=0;
        for(var m=10;m>0;m-=0.125){
            var shindo=calcJmaShindo(m,epiDepth,epiLat,epiLon,atLat,atLon);
            var error=Math.abs(shindo-niedShindo);
            if(error<closestError){
                closestError=error;
                closestM=m;
            }
        }
        return closestM;
    }

    property var estimateQMLMarkList: []

    function calcMaxInt(magnitude,depth)
    {
        var a = 1.65 * magnitude;
        var b = depth < 10 ? 1.21 : 1.21 * Math.log10(depth);
        return Math.min(Math.max(0.0,Math.round(a / b)),12.0);
    }

    function isMisDetectedStation(stationIndex,recordTimeIndex){
        var lat=detailedYahooStationData.items[stationIndex].lat;
        var lon=detailedYahooStationData.items[stationIndex].lon;
        var indexLat=Math.floor(lat)+90;
        var indexLon=Math.floor(lon)+180;
        var gridStationIndexList=stationIndexGrid[indexLat][indexLon];
        var stationLevel1Count=0;
        for(var index of gridStationIndexList){
            if(yahooStationRealtimeData[index][recordTimeIndex]>=yahooStationMinDetectShindo)
                stationLevel1Count++;
        }
        if(stationLevel1Count>=3||stationLevel1Count>=gridStationIndexList.length){
            return false;
        }
        return true;
    }

    //由于计算量大，最好放到子线程中去算
    function estimateEpicenter(){
        //有EEW时不推算
        if(eewCircleMapView.mapItems.length>0){
            setEstimateQMLMark([]);
            return;
        }
        //1.先判断是否达到检测条件（存在同一格子内至少3点或全部检出震度1（雅虎震度8）以上）
        //举例：（北京时间）2026-04-24 08:44:10-08:44:50单点震度7不应检出
        //2026-04-20 15:52:55-16:02:57有警报检出(2026-04-20 15:53:15)
        //2025-07-30 07:24:29无警报检出
        //2026-02-23 00:57:46远震检出
        //2024-04-03 07:58:08台湾单点检出
        //日本北海道 2026-04-27 04:23:55 (UTC+8) M6.1 80km 预估最大烈度7
        //注意雅虎只能回放近一个月内的
        var triggeredDetection=false;
        for(var e of gridsThatHaveStationLatLng){
            var indexLat=Math.floor(e/65536);//纬度索引（整数纬度+90）
            var indexLon=e%65536;//经度索引（整数经度+180）
            var eachGridStationIndexList=stationIndexGrid[indexLat][indexLon];//这个格子里的测站索引列表
            var stationLevel1Count=0;//这个格子里震度1以上的测站数
            for(var index of eachGridStationIndexList){
                if(yahooStationQMLItem[index].shindo>=yahooStationMinDetectShindo){
                    stationLevel1Count++;
                }
            }
            //是否符合检测条件（可适当修改）
            if(stationLevel1Count>=3||stationLevel1Count>=eachGridStationIndexList.length){
                triggeredDetection=true;
                break;
            }
        }
        if(!triggeredDetection){
            setEstimateQMLMark([]);
            return;
        }
        //2.记录检出时刻，找到最早检测到的站点（从震度-时间图上找，必须采用这种方法，后面还会用到这个结果）
        var stationsEarliestDetectedTimeSec=[];//时间戳秒数，没有则为undefined
        var countStationsDetected=0;
        var earliestDetectedStationIndex=-1;
        var foundEarliestDetected=false;
        var i;
        for(i=0;i<yahooStationRealtimeData.length;i++){
            for(var realTimeDataTime=0;realTimeDataTime<yahooStationRealtimeData[i].length;realTimeDataTime++){
                if(yahooStationRealtimeData[i][realTimeDataTime]>=yahooStationMinDetectShindo&&!isMisDetectedStation(i,realTimeDataTime)){
                    countStationsDetected++;
                    stationsEarliestDetectedTimeSec[i]=yahooStationRealtimeDataTimestampSec-yahooStationRealtimeData[i].length+1+realTimeDataTime;
                    if(earliestDetectedStationIndex===-1||stationsEarliestDetectedTimeSec[i]<stationsEarliestDetectedTimeSec[earliestDetectedStationIndex]){
                        earliestDetectedStationIndex=i;
                    }
                    break;
                }
            }
        }
        //数据被重置造成最早检出数据消失，停止运算
        if(earliestDetectedStationIndex===-1){
            setEstimateQMLMark([]);
            return;
        }
        //数据超过记录的有效期，停止运算
        if(stationsEarliestDetectedTimeSec[earliestDetectedStationIndex]<=yahooStationRealtimeDataTimestampSec-yahooStationRealtimeDataMaxLength+2){
            setEstimateQMLMark([]);
            return;
        }
        //3.1.从该点深处10km开始搜索：按0.5度步长（4个边方向），0.1度步长（4个边方向，0.5度以内），深度50km带0.1度步长（6个面方向，0.5度以内），深度10km带0.1度步长（6个面方向，）搜索
        var varianceAtLatLngDepth={};//方差，以字典方式存储，key为数值型，{##.###(lat):{##.###(lng):{##(depth):{d:方差数值,t:发震时间（时间戳秒数）},...},...},...}
        var minVariance=null;
        //先假设为10km深，发震时刻为最初检出时-2秒
        //0.5度步长
        var earliestDetectedStationLat=detailedYahooStationData.items[earliestDetectedStationIndex].lat;
        var earliestDetectedStationLon=detailedYahooStationData.items[earliestDetectedStationIndex].lon;
        for(var stepMaxDegree=0;stepMaxDegree<180;stepMaxDegree+=0.5){
            //上下左右四个边
            var lat,lon,variance;
            var newMinVariance=false;
            //上边
            lat=earliestDetectedStationLat+stepMaxDegree;
            for(lon=earliestDetectedStationLon-stepMaxDegree;
                lon<=earliestDetectedStationLon+stepMaxDegree;lon+=0.5){
                if(lat>-90&&lat<90){
                    //有效位置
                    variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                     earliestDetectedStationLat,
                                                     earliestDetectedStationLon,lat,limitLon(lon),10);
                    if(minVariance===null||variance<minVariance){
                        newMinVariance=true;
                        minVariance=variance;
                    }
                }
            }
            //下边
            lat=earliestDetectedStationLat-stepMaxDegree;
            for(lon=earliestDetectedStationLon-stepMaxDegree;
                lon<=earliestDetectedStationLon+stepMaxDegree;lon+=0.5){
                if(lat>-90&&lat<90){
                    //有效位置
                    variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                     earliestDetectedStationLat,
                                                     earliestDetectedStationLon,lat,limitLon(lon),10);
                    if(minVariance===null||variance<minVariance){
                        newMinVariance=true;
                        minVariance=variance;
                    }
                }
            }
            //左边
            lon=limitLon(earliestDetectedStationLon-stepMaxDegree);
            for(lat=earliestDetectedStationLat-stepMaxDegree+0.5;
                lat<earliestDetectedStationLat+stepMaxDegree;lat+=0.5){
                if(lat>-90&&lat<90){
                    //有效位置
                    variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                     earliestDetectedStationLat,
                                                     earliestDetectedStationLon,lat,lon,10);
                    if(minVariance===null||variance<minVariance){
                        newMinVariance=true;
                        minVariance=variance;
                    }
                }
            }
            //右边
            lon=limitLon(earliestDetectedStationLon+stepMaxDegree);
            for(lat=earliestDetectedStationLat-stepMaxDegree+0.5;
                lat<earliestDetectedStationLat+stepMaxDegree;lat+=0.5){
                if(lat>-90&&lat<90){
                    //有效位置
                    variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                     earliestDetectedStationLat,
                                                     earliestDetectedStationLon,lat,lon,10);
                    if(minVariance===null||variance<minVariance){
                        newMinVariance=true;
                        minVariance=variance;
                    }
                }
            }
            if(!newMinVariance)//没有更小的方差，结束搜索
                break;
        }
        //3.2.计算方差极小值的点，并判断是否符合精度条件（N点检出L长度，可以设为多个等级）
        //找到所有极小值点
        var veryMinVarianceLocationList=[];//[[lat,lon],...]
        for(lat=earliestDetectedStationLat-stepMaxDegree;
            lat<=earliestDetectedStationLat+stepMaxDegree;lat+=0.5){
            for(lon=earliestDetectedStationLon-stepMaxDegree;
                lon<=earliestDetectedStationLon+stepMaxDegree;lon+=0.5){
                var findlon=limitLon(lon);
                var upVar=varianceAtLatLngDepth[lat+0.5]&&varianceAtLatLngDepth[lat+0.5][findlon]&&varianceAtLatLngDepth[lat+0.5][findlon][10].d;
                var downVar=varianceAtLatLngDepth[lat-0.5]&&varianceAtLatLngDepth[lat-0.5][findlon]&&varianceAtLatLngDepth[lat-0.5][findlon][10].d;
                var leftLon=limitLon(lon-0.5);
                var leftVar=varianceAtLatLngDepth[lat]&&varianceAtLatLngDepth[lat][leftLon]&&varianceAtLatLngDepth[lat][leftLon][10].d;
                var rightLon=limitLon(lon+0.5);
                var rightVar=varianceAtLatLngDepth[lat]&&varianceAtLatLngDepth[lat][rightLon]&&varianceAtLatLngDepth[lat][rightLon][10].d;
                var myVar=varianceAtLatLngDepth[lat]&&varianceAtLatLngDepth[lat][findlon]&&varianceAtLatLngDepth[lat][findlon][10].d;
                if(upVar&&downVar&&leftVar&&rightVar&&myVar<upVar&&myVar<downVar&&myVar<leftVar&&myVar<rightVar){
                    veryMinVarianceLocationList.push([lat,findlon]);
                }
            }
        }
        //3.3.符合条件的列入结果，计算经纬度、深度、时间、震级
        //只算最多前3个方差小的候选点（先排序）
        veryMinVarianceLocationList.sort((a,b)=>(varianceAtLatLngDepth[a[0]][a[1]][10].d-varianceAtLatLngDepth[b[0]][b[1]][10].d));
        if(veryMinVarianceLocationList.length>3)
            veryMinVarianceLocationList.length=3;
        //0.1度步长
        var minimumVarianceLocationList=[];//[[lat,lon],...]
        for(i=0;i<veryMinVarianceLocationList.length;i++){
            minVariance=null;
            var searchingLat=veryMinVarianceLocationList[i][0];
            var searchingLon=veryMinVarianceLocationList[i][1];
            for(stepMaxDegree=0;stepMaxDegree<0.5/*180*/;stepMaxDegree+=0.1){
                newMinVariance=false;
                //上边
                lat=searchingLat+stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,10);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon];
                        }
                    }
                }
                //下边
                lat=searchingLat-stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,10);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon];
                        }
                    }
                }
                //左边
                lon=limitLon(searchingLon-stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,10);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon];
                        }
                    }
                }
                //右边
                lon=limitLon(searchingLon+stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,10);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon];
                        }
                    }
                }
                if(!newMinVariance)
                    break;
            }
        }
        //深度50km带0.1度步长（由于性能太差，0.1度步长只在深度确定好后再计算）
        //在这步中minimumVarianceLocationList还要存储深度信息
        const mixDepthAndLocSearching=false;//同时搜索深度和经纬度（增加一重循环，性能低）
        var minVarDepth=0;//km
        for(i=0;i<minimumVarianceLocationList.length;i++){
            minVariance=null;
            searchingLat=minimumVarianceLocationList[i][0];
            searchingLon=minimumVarianceLocationList[i][1];
            for(var searchingDepth=0;searchingDepth<=700;searchingDepth+=50){
                newMinVariance=false;
                for(stepMaxDegree=0;stepMaxDegree<0.5;stepMaxDegree+=mixDepthAndLocSearching?0.1:1){
                    //上边
                    lat=searchingLat+stepMaxDegree;
                    for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                        if(lat>-90&&lat<90){
                            findlon=limitLon(lon);
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,findlon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                            }
                        }
                    }
                    //下边
                    lat=searchingLat-stepMaxDegree;
                    for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                        if(lat>-90&&lat<90){
                            findlon=limitLon(lon);
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,findlon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                            }
                        }
                    }
                    //左边
                    lon=limitLon(searchingLon-stepMaxDegree);
                    for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                        if(lat>-90&&lat<90){
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,lon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                            }
                        }
                    }
                    //右边
                    lon=limitLon(searchingLon+stepMaxDegree);
                    for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                        if(lat>-90&&lat<90){
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,lon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                            }
                        }
                    }
                }
                if(newMinVariance)
                    minVarDepth=searchingDepth;
                else
                    break;
            }
            if(!mixDepthAndLocSearching){
            newMinVariance=false;
            searchingDepth=minVarDepth;
            for(stepMaxDegree=0;stepMaxDegree<0.5;stepMaxDegree+=0.1){
                //上边
                lat=searchingLat+stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                        }
                    }
                }
                //下边
                lat=searchingLat-stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                        }
                    }
                }
                //左边
                lon=limitLon(searchingLon-stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                        }
                    }
                }
                //右边
                lon=limitLon(searchingLon+stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                        }
                    }
                }
                if(!minVariance)
                    break;
            }
            }
        }
        //深度10km带0.1度步长（同上性能太差分开计算）
        for(i=0;i<minimumVarianceLocationList.length;i++){
            minVariance=null;
            searchingLat=minimumVarianceLocationList[i][0];
            searchingLon=minimumVarianceLocationList[i][1];
            var searchingStartDepth=minimumVarianceLocationList[i][2];
            for(searchingDepth=Math.max(0,searchingStartDepth-50);searchingDepth<=700&&searchingDepth<=searchingStartDepth+50;searchingDepth+=10){
                newMinVariance=false;
                for(stepMaxDegree=0;stepMaxDegree<0.5;stepMaxDegree+=mixDepthAndLocSearching?0.1:1){
                    //上边
                    lat=searchingLat+stepMaxDegree;
                    for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                        if(lat>-90&&lat<90){
                            findlon=limitLon(lon);
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,findlon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                            }
                        }
                    }
                    //下边
                    lat=searchingLat-stepMaxDegree;
                    for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                        if(lat>-90&&lat<90){
                            findlon=limitLon(lon);
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,findlon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                            }
                        }
                    }
                    //左边
                    lon=limitLon(searchingLon-stepMaxDegree);
                    for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                        if(lat>-90&&lat<90){
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,lon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                            }
                        }
                    }
                    //右边
                    lon=limitLon(searchingLon+stepMaxDegree);
                    for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                        if(lat>-90&&lat<90){
                            variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                             searchingLat,searchingLon,lat,lon,searchingDepth);
                            if(minVariance===null||variance<minVariance){
                                newMinVariance=true;
                                minVariance=variance;
                                minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                            }
                        }
                    }
                }
                if(newMinVariance)
                    minVarDepth=searchingDepth;
                else
                    break;
            }
            if(!mixDepthAndLocSearching){
            newMinVariance=false;
            searchingDepth=minVarDepth;
            for(stepMaxDegree=0;stepMaxDegree<0.5;stepMaxDegree+=0.1){
                //上边
                lat=searchingLat+stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                        }
                    }
                }
                //下边
                lat=searchingLat-stepMaxDegree;
                for(lon=searchingLon-stepMaxDegree;lon<=searchingLon+stepMaxDegree;lon+=0.1){
                    if(lat>-90&&lat<90){
                        findlon=limitLon(lon);
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,findlon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,findlon,searchingDepth];
                        }
                    }
                }
                //左边
                lon=limitLon(searchingLon-stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                        }
                    }
                }
                //右边
                lon=limitLon(searchingLon+stepMaxDegree);
                for(lat=searchingLat-stepMaxDegree+0.1;lat<searchingLat+stepMaxDegree;lat+=0.1){
                    if(lat>-90&&lat<90){
                        variance=_calcVarianceAtLocation(varianceAtLatLngDepth,countStationsDetected,stationsEarliestDetectedTimeSec,
                                                         searchingLat,searchingLon,lat,lon,searchingDepth);
                        if(minVariance===null||variance<minVariance){
                            newMinVariance=true;
                            minVariance=variance;
                            minimumVarianceLocationList[i]=[lat,lon,searchingDepth];
                        }
                    }
                }
                if(!newMinVariance)
                    break;
            }
            }
        }
        //minimumVarianceLocationList即为所求，在varianceAtLatLngDepth上查找可得发震时间，方差数值，sqrt（方差/检出数）均摊误差
        //minimumVarianceLocationList在此处新增时间，震级，方差，误差等信息，存储变为：[lat,lon,depth,time,mag,var,rms]
        for(i=0;i<minimumVarianceLocationList.length;i++){
            //求震级（这里为了计算快只取第一个检出测站的最大震度计算）
            var loc=minimumVarianceLocationList[i];
            var earliestDetectedStationMaxShindo=-1;
            for(var j=0;j<yahooStationRealtimeData[earliestDetectedStationIndex].length;j++){
                earliestDetectedStationMaxShindo=Math.max(earliestDetectedStationMaxShindo,yahooStationRealtimeData[earliestDetectedStationIndex][j]);
            }
            var estiMag=calcEstimateMagnitude(loc[0],loc[1],loc[2],
                                              detailedYahooStationData.items[earliestDetectedStationIndex].lat,
                                              detailedYahooStationData.items[earliestDetectedStationIndex].lon,
                                              0,earliestDetectedStationMaxShindo);
            minimumVarianceLocationList[i].push(varianceAtLatLngDepth[loc[0]][loc[1]][loc[2]].t,
                estiMag,varianceAtLatLngDepth[loc[0]][loc[1]][loc[2]].d,
                varianceAtLatLngDepth[loc[0]][loc[1]][loc[2]].d/countStationsDetected);
        }

        //显示在地图上
        setEstimateQMLMark(minimumVarianceLocationList);

        //4.1.备份原视图位置，将视图移动到检出点和推算震源位置
        //4.2.若遇到其他事件造成视图变化则将备份视图位置改为其他事件的位置
        //4.3.所有检出结束后恢复备份视图位置
    }

    property var estEpiBackupLatitude: 0
    property var estEpiBackupLongitude: 0
    property var estEpiBackupZoom: 0
    property var estEpiLastEpiCount: 0
    property var estEpiPWaveQMLItem: []
    property var estEpiSWaveQMLItem: []

    function setEstimateQMLMark(minimumVarianceLocationList){
        for(var i=0;i<minimumVarianceLocationList.length;i++){
            var loc=minimumVarianceLocationList[i];
            var sl=(3+1.5*Math.exp(0.25*calcMaxInt(loc[4],loc[2])))*5;
            if(estimateQMLMarkList[i]===undefined){
                estimateQMLMarkList[i]=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                    'MapQuickItem {property var magnitude:0;property var depth:0;property var dvar:0;property var rms:0;property var sl:1;property var eqtime:0;'+
                    'anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                    'sourceItem:Rectangle{anchors.centerIn:parent;'+
                    'Image{id:img;width:sl;height:width;source:\''+uriSvgEstimateEpicenter+'\';mipmap:true}'+
                    'Text{text:new Date(eqtime*1000).toTimeString().substr(0,8)+" M"+magnitude.toFixed(1)+" "+Math.round(depth)+"km\nD="+dvar.toFixed(2)+" R="+rms.toFixed(2);font.family:textEEWTime.font.family;font.pixelSize:14;font.bold:true;'+
                    'style:Text.Outline;color:"white";anchors.horizontalCenter:img.horizontalCenter;anchors.top:img.bottom}}}',estimateEpicenterMapView);
                estimateEpicenterMapView.addMapItem(estimateQMLMarkList[i]);
            }
            estimateQMLMarkList[i].sl=sl;
            estimateQMLMarkList[i].magnitude=loc[4];
            estimateQMLMarkList[i].depth=loc[2];
            estimateQMLMarkList[i].dvar=loc[5];
            estimateQMLMarkList[i].rms=loc[6];
            estimateQMLMarkList[i].eqtime=loc[3];
            estimateQMLMarkList[i].coordinate=QtPositioning.coordinate(loc[0],loc[1]);

            if(estEpiPWaveQMLItem[i]===undefined){
                estEpiPWaveQMLItem[i]=Qt.createQmlObject('import QtLocation 5.14; MapCircle{'+
                    'property var eqtime:0;property var depth:0}',estimateEpicenterMapView);
                estEpiPWaveQMLItem[i].color="transparent";
                estEpiPWaveQMLItem[i].border.color="white";
                estEpiPWaveQMLItem[i].border.width=1;
                estimateEpicenterMapView.addMapItem(estEpiPWaveQMLItem[i]);
            }
            estEpiPWaveQMLItem[i].center=QtPositioning.coordinate(loc[0],loc[1]);
            estEpiPWaveQMLItem[i].eqtime=loc[3];
            estEpiPWaveQMLItem[i].depth=loc[2];

            if(estEpiSWaveQMLItem[i]===undefined){
                estEpiSWaveQMLItem[i]=Qt.createQmlObject('import QtLocation 5.14; MapCircle{'+
                    'property var eqtime:0;property var depth:0}',estimateEpicenterMapView);
                estEpiSWaveQMLItem[i].color="transparent";
                estEpiSWaveQMLItem[i].border.color="white";
                estEpiSWaveQMLItem[i].border.width=1;
                estimateEpicenterMapView.addMapItem(estEpiSWaveQMLItem[i]);
            }
            estEpiSWaveQMLItem[i].center=QtPositioning.coordinate(loc[0],loc[1]);
            estEpiSWaveQMLItem[i].eqtime=loc[3];
            estEpiSWaveQMLItem[i].depth=loc[2];
        }
        for(;i<estimateQMLMarkList.length;i++){
            estimateEpicenterMapView.removeMapItem(estimateQMLMarkList[i]);
            estimateEpicenterMapView.removeMapItem(estEpiPWaveQMLItem[i]);
            estimateEpicenterMapView.removeMapItem(estEpiSWaveQMLItem[i]);
            estimateQMLMarkList[i].destroy();
            estEpiPWaveQMLItem[i].destroy();
            estEpiSWaveQMLItem[i].destroy();
        }
        estimateQMLMarkList.length=minimumVarianceLocationList.length;
        estEpiPWaveQMLItem.length=minimumVarianceLocationList.length;
        estEpiSWaveQMLItem.length=minimumVarianceLocationList.length;
        if(minimumVarianceLocationList.length===0){
            estimateEpicenterMapView.visible=false;
            legendEstimateEpicenter.visible=false;
            eewMarkMapView.visible=true;
            historyMarkMapView.visible=true;
            if(estEpiLastEpiCount>0){
                //恢复视图
                focusLocationWithEstEpi(estEpiBackupLatitude,estEpiBackupLongitude,estEpiBackupZoom,true);
                //停止计算震波的计时器
                timerEstEpiWave.stop();
            }
        }else{
            estimateEpicenterMapView.visible=true;
            legendEstimateEpicenter.visible=minimumVarianceLocationList.length>0;
            eewMarkMapView.visible=minimumVarianceLocationList.length===0;
            historyMarkMapView.visible=minimumVarianceLocationList.length===0;
            //调整视图
            if(estEpiLastEpiCount===0){
                //需要备份当前视图
                estEpiBackupLatitude=mapView.center.latitude;
                estEpiBackupLongitude=mapView.center.longitude;
                estEpiBackupZoom=mapView.zoomLevel;
                //启动计算震波的计时器
                timerEstEpiWave.start();
            }
            fitViewportToEstimateEpicenter();
        }
        estEpiLastEpiCount=minimumVarianceLocationList.length;
    }

    Timer{
        id:timerEstEpiWave
        interval: 50
        repeat: true
        running: false
        onTriggered: {
            var now=Date.now()/1000-yahooPlaybackDeltaSec-yahooStationQueryAccumulatedDelaySec;
            for(var i=0;i<estEpiPWaveQMLItem.length;i++){
                estEpiPWaveQMLItem[i].radius=getTravelTimeObject().getTravelSurfaceDistanceByTable(0,estEpiPWaveQMLItem[i].depth,now-estEpiPWaveQMLItem[i].eqtime)*1000;
                estEpiSWaveQMLItem[i].radius=getTravelTimeObject().getTravelSurfaceDistanceByTable(1,estEpiSWaveQMLItem[i].depth,now-estEpiSWaveQMLItem[i].eqtime)*1000;
            }
        }
    }

    property string mapboxStyleJson: ""//保存转换后的Mapbox Style

    function _convertMapboxStyle(mapboxStyleUrl,isBuiltIn){
        //检查Token是否可检索Style
        var xhr=new XMLHttpRequest();
        xhr.open("GET",mapboxStyleUrl,true);
        xhr.onreadystatechange=function(){
            if(xhr.readyState===4&&xhr.status===200){
                if(isBuiltIn){
                    maplibreStyle.value="https://lxfly2000.github.io/eewcn-res/qml/mapbox-style.json";
                    showWarningCenter(false,"");
                }else{
                    var a=mapboxStyleUrl.substr(mapboxStyleUrl.indexOf("?access_token=")+14);
                    var styleJson=JSON.parse(xhr.responseText);
                    //https://docs.mapbox.com/api/maps/mapbox-tiling-service/#retrieve-tilejson-metadata
                    styleJson.sources.composite.url="https://api.mapbox.com/v4/"+styleJson.sources.composite.url.substr(9)+".json?access_token="+a;
                    //https://docs.mapbox.com/api/maps/styles/#retrieve-a-sprite-image-or-json
                    styleJson.sprite="https://api.mapbox.com/styles/v1/"+styleJson.sprite.substr(styleJson.sprite.indexOf("/sprites/")+9)+"/sprite@2x?access_token="+a;
                    //https://docs.mapbox.com/api/maps/fonts/#retrieve-font-glyph-ranges
                    styleJson.glyphs="https://api.mapbox.com/fonts/v1/"+styleJson.glyphs.substr(styleJson.glyphs.indexOf("/fonts/")+7)+"?access_token="+a;
                    //maplibreStyle.value="data:application/json,"+JSON.stringify(styleJson);//TODO：注意这里这样做没有效果，需要修正
                    mapboxStyleJson=JSON.stringify(styleJson);
                    maplibreStyle.value="https://demotiles.maplibre.org/style.json";
                    showWarningCenter(true,"不支持mapbox://链接。\nmapbox:// URL is not supported.\nmapbox:// URLは使用できません。");
                }
            }else{
                //maplibreStyle.value="https://demotiles.maplibre.org/style.json";
                if(isBuiltIn){
                    showWarningCenter(true,"程序内置的Mapbox Token暂时不可用，\n请更换Token.\n"+
                        "The built-in Mapbox token is currently unavailable,\nplease use another token.\n"+
                        "ご使用中の内蔵Mapbox Tokenは現在利用できません。\n別のTokenに交換してください。");
                }else{
                    showWarningCenter(true,"无法获取地图样式。\n"+
                        "Cannot get map style.\n"+
                        "マップスタイルは取得できません。");
                }
            }
        };
        xhr.send();
    }

    function setMapboxLogoVisible(v){
        mapView.copyrightsVisible=v;
        columnLegends.anchors.bottomMargin=v?25:2;
    }

    function clearEEWMarks(){
        eewMarkMapView.clearMapItems();
        for(var key in eewItems){
            eewItems[key].destroy();
        }
        eewItems={};
    }

    function clearHistoryMarks(){
        historyMarkMapView.clearMapItems();
        for(var i=0;i<historyItems.length;i++){
            historyItems[i].destroy();
        }
        historyItems=[];
    }

    function setHome(latitude,longitude){
        if(homeItem===null){
            if(runningOS==="Android"){
                homeItem=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                            'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                            'sourceItem:Image{id:img;width:50;height:50;source:"assets:Media/green.svg";mipmap: true}}',homeMarkMapView);
            }else{
                homeItem=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                            'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                            'sourceItem:Image{id:img;width:50;height:50;source:"file:Media/green.svg";mipmap: true}}',homeMarkMapView);
            }
            homeMarkMapView.addMapItem(homeItem);
        }
        homeItem.coordinate=QtPositioning.coordinate(latitude,longitude);
    }

    function putEEWMark(eventId,latitude,longitude,intensity){
        var sl=(3+1.5*Math.exp(0.25*intensity))*5;
        //注意此处应合并为一个脚本创建，否则会有释放不掉的问题
        var item;
        if(runningOS==="Android"){
            item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                        'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                        'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"assets:Media/cross.svg";mipmap: true}}',eewMarkMapView);
        }else{
            item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                        'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                        'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"file:Media/cross.svg";mipmap: true}}',eewMarkMapView);
        }
        item.coordinate=QtPositioning.coordinate(latitude,longitude);
        item.visible=!eewMarksTimer.running;
        eewItems[eventId]=item;
        eewMarkMapView.addMapItem(item);
    }

    function putHistoryMark(latitude,longitude,intensity){
        var sl=(3+1.5*Math.exp(0.25*intensity))*5;
        //注意此处应合并为一个脚本创建，否则会有释放不掉的问题
        var item;
        if(runningOS==="Android"){
            item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                        'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                        'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"assets:Media/red.svg";mipmap: true}}',historyMarkMapView);
        }else{
            item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                        'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                        'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"file:Media/red.svg";mipmap: true}}',historyMarkMapView);
        }
        item.coordinate=QtPositioning.coordinate(latitude,longitude);
        item.visible=!eewMarksTimer.running;
        historyItems.push(item);
        historyMarkMapView.addMapItem(item);
    }

    function setHistoryMarkVisible(index,_visible){
        historyItems[index].visible=_visible;
    }

    function focusLocationSupplement(latitude,longitude,zoom){
        //可无视层级关系直接用id引用节点
        supplementMapView.center=QtPositioning.coordinate(latitude,longitude);
        supplementMapView.zoomLevel=zoom;
    }

    function focusLocation(latitude,longitude,zoom){
        return focusLocationWithEstEpi(latitude,longitude,zoom,false);
    }

    function focusLocationWithEstEpi(latitude,longitude,zoom,isEstEpi){
        if(checkLockView.checked){
            return;
        }
        if(!isEstEpi){
            estEpiBackupLatitude=latitude;
            estEpiBackupLongitude=longitude;
            estEpiBackupZoom=zoom;
        }

        mapView.tilt=0;
        mapView.bearing=0;
        if(checkNoAnimation.checked){
            mapView.zoomLevel=zoom;
            mapView.center=QtPositioning.coordinate(latitude,longitude);
        }else{
            animMapLatitude.to=latitude;
            animMapLongitude.to=longitude;
            animMapZoomLevel.to=zoom;
            animMapLatitude.start();
            animMapLongitude.start();
            animMapZoomLevel.start();
        }
    }

    function refreshMarks(){
        refreshIntensityPolygons();
        eewCircleMapView.clearMapItems();
        for(var item in pwaveItems){
            eewCircleMapView.addMapItem(pwaveItems[item]);
        }
        for(item in swaveItems){
            eewCircleMapView.addMapItem(swaveItems[item]);
        }
        historyMarkMapView.clearMapItems();
        for(item of historyItems){
            historyMarkMapView.addMapItem(item);
        }
        homeMarkMapView.clearMapItems();
        homeMarkMapView.addMapItem(homeItem);
        eewMarkMapView.clearMapItems();
        for(item in eewItems){
            eewMarkMapView.addMapItem(eewItems[item]);
        }
        numberBarMapView.clearMapItems();
        for(item in barItems){
            numberBarMapView.addMapItem(barItems[item]);
        }
        for(item in numberItems){
            numberBarMapView.addMapItem(numberItems[item]);
        }
        stationMarkMapView.clearMapItems();
        for(item of stationItems){
            stationMarkMapView.addMapItem(item);
        }
        yahooStationMarkMapView.clearMapItems();
        for(item of yahooStationQMLItem){
            yahooStationMarkMapView.addMapItem(item);
        }
        estimateEpicenterMapView.clearMapItems();
        for(item of estimateQMLMarkList){
            estimateEpicenterMapView.addMapItem(item);
        }
        for(item of estEpiPWaveQMLItem){
            estimateEpicenterMapView.addMapItem(item);
        }
        for(item of estEpiSWaveQMLItem){
            estimateEpicenterMapView.addMapItem(item);
        }
    }

    function setEEWCircle(eventId,latitude,longitude,depth,elapsedMilliseconds,radiusPwave,radiusSwave,intensity,iNumber){
        //var sii=0;
        //iNumber用于有多个震源时显示标号，但根据国内的地震速报情况来看，感觉暂时用不到
        if(pwaveItems[eventId]===undefined){
            pwaveItems[eventId]=Qt.createQmlObject('import QtLocation 5.14; MapCircle {}',eewCircleMapView);
            pwaveItems[eventId].color='transparent';//填充色
            pwaveItems[eventId].border.color='white';//边线色，对mapboxgl貌似不起作用
            pwaveItems[eventId].border.width=1;//边线宽，对mapboxgl貌似不起作用
            eewCircleMapView.addMapItem(pwaveItems[eventId]);
        }
        if(swaveItems[eventId]===undefined){
            var item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;import QtGraphicalEffects 1.12; MapCircle {RadialGradient {anchors.fill: parent;gradient: Gradient {'+
                'GradientStop { position: 0.0; color: "transparent" }'+
                'GradientStop { position: 0.25; color: "transparent" }'+
                'GradientStop { id: gradientColorSWave; position: 0.49609375; color: "transparent" }'+
                'GradientStop { position: 0.5; color: "transparent" }}}function setColorGradient(c){gradientColorSWave.color=c;}}',eewCircleMapView);
            item.border.width=3;//边线宽，对mapboxgl貌似不起作用
            item.color='transparent';//填充色设为空，其颜色由RadialGradient控制
            eewCircleMapView.addMapItem(item);
            swaveItems[eventId]=item;
        }
        if(numberItems[eventId]===undefined){
            numberItems[eventId]=Qt.createQmlObject('import QtLocation 5.14;MapQuickItem{scale:getWindowZoom()}',numberBarMapView);
            var numText=Qt.createQmlObject('import QtQuick 2.14;Text{}',numberBarMapView);
            numText.color="#ffffff";
            numText.font.family=textEEWTime.font.family;
            numText.font.bold=true;
            numText.style=Text.Outline;
            numText.font.pixelSize=24;
            numberItems[eventId].sourceItem=numText;
            numberItems[eventId].visible=false;
            numberBarMapView.addMapItem(numberItems[eventId]);
        }
        var numTextItem=numberItems[eventId].sourceItem;
        var eventIdIndex=eventIdList.indexOf(eventId);
        numTextItem.text=String.fromCharCode(9312+eventIdIndex);
        switch(eventIdIndex%4){
            case 0:default:
                numberItems[eventId].anchorPoint.x=numTextItem.width/2;
                numberItems[eventId].anchorPoint.y=numTextItem.height/2+50*getWindowZoom();
                break;
            case 1:
                numberItems[eventId].anchorPoint.x=numTextItem.width/2;
                numberItems[eventId].anchorPoint.y=numTextItem.height/2-50*getWindowZoom();
                break;
            case 2:
                numberItems[eventId].anchorPoint.x=numTextItem.width/2-50*getWindowZoom();
                numberItems[eventId].anchorPoint.y=numTextItem.height/2;
                break;
            case 3:
                numberItems[eventId].anchorPoint.x=numTextItem.width/2+50*getWindowZoom();
                numberItems[eventId].anchorPoint.y=numTextItem.height/2;
                break;
        }
        numberItems[eventId].coordinate=QtPositioning.coordinate(latitude,longitude);

        swaveIntensities[eventId]=intensity;
        swaveItems[eventId].setColorGradient("#55"+getIntColors(intensity).substr(1));
        swaveItems[eventId].border.color=getIntLineColor(intensity);//边线色，对mapboxgl貌似不起作用
        if(radiusSwave<0){
            if(barItems[eventId]===undefined){
                /*var*/ item=Qt.createQmlObject('import QtLocation 5.14; MapQuickItem {scale:getWindowZoom()}',numberBarMapView);
                var rb=Qt.createQmlObject('import QtQuick 2.14;Rectangle{}',numberBarMapView);
                var rpw=Qt.createQmlObject('import QtQuick 2.14;Rectangle{}',numberBarMapView);
                var rsw=Qt.createQmlObject('import QtQuick 2.14;Rectangle{}',numberBarMapView);
                rb.color='transparent';
                rb.border.color='white';//边框色
                rb.border.width=1;//边框宽
                rb.width=10;//整体条宽度
                rb.height=50;//整体条高度
                rpw.color='#A1E0BA';
                rpw.border.width=0;
                rpw.x=rb.border.width;
                rpw.width=rb.width-rb.border.width*2;
                //rsw.color=getIntColors(intensity);
                rsw.border.width=0;
                rsw.x=rb.border.width;
                rsw.width=rb.width-rb.border.width*2;
                rb.children.push(rpw);
                rb.children.push(rsw);
                item.anchorPoint.y=rb.height/2;//调整锚点
                item.sourceItem=rb;
                //item.coordinate=QtPositioning.coordinate(latitude,longitude);
                barItems[eventId]=item;
                numberBarMapView.addMapItem(barItems[eventId]);
            }
            barItems[eventId].anchorPoint.x=barItems[eventId].sourceItem.width/2-50*getWindowZoom();//调整锚点
            barItems[eventId].coordinate=QtPositioning.coordinate(latitude,longitude);
            var rectBorder=barItems[eventId].sourceItem;
            var pBar=rectBorder.children[0];
            var sBar=rectBorder.children[1];
            var fillh=rectBorder.height-rectBorder.border.width*2;
            sBar.color=getIntColors(intensity);
            pBar.height=Math.min(1,(1+radiusPwave/depth))*fillh;
            sBar.height=Math.min(1,(1+radiusSwave/depth))*fillh;
            pBar.y=rectBorder.border.width+fillh-pBar.height;
            sBar.y=rectBorder.border.width+fillh-sBar.height;
        }else if(barItems[eventId]!==undefined){
            numberBarMapView.removeMapItem(barItems[eventId]);
            barItems[eventId].destroy();
            delete barItems[eventId];
        }

        pwaveItems[eventId].center=QtPositioning.coordinate(latitude,longitude);
        pwaveItems[eventId].radius=Math.max(0,radiusPwave*1000);//单位米，涉及参数较多，在C++中运算
        swaveItems[eventId].center=pwaveItems[eventId].center;
        swaveItems[eventId].radius=Math.max(0,radiusSwave*1000);//单位米，涉及参数较多，在C++中运算
        if(!eewMarksTimer.running){
            for(var key in eewItems)
                eewItems[key].visible=false;
            for(key in historyItems)
                historyItems[key].visible=false;
            eewMarksTimer.start();
            legendPSWave.visible=true;
        }
    }

    function removeEEWCircle(eventId){
        eewCircleMapView.removeMapItem(pwaveItems[eventId]);
        numberBarMapView.removeMapItem(numberItems[eventId]);
        pwaveItems[eventId].destroy();
        delete pwaveItems[eventId];
        eewCircleMapView.removeMapItem(swaveItems[eventId]);
        swaveItems[eventId].destroy();
        delete swaveItems[eventId];
        delete swaveIntensities[eventId];
        numberItems[eventId].destroy();
        delete numberItems[eventId];
        if(Object.keys(pwaveItems).length===0){
            legendPSWave.visible=false;
            eewMarksTimer.stop();
            for(var key in eewItems)
                eewItems[key].visible=true;
            for(key in historyItems)
                historyItems[key].visible=true;
        }else{
            for(key in eewItems)
                eewItems[key].visible=false;
            for(key in numberItems)
                numberItems[key].visible=false;
        }
    }

    function posToGeo(x,y){
        var c = mapView.toCoordinate(Qt.point(x,y),false);
        return {latitude:c.latitude,longitude:c.longitude};
    }

    function geoToPos(lat,lng){
        return mapView.fromCoordinate(QtPositioning.coordinate(lat,lng),false);
    }

    //太平洋视角中心
    function _PC(deg){
        return deg<0?deg+360:deg;
    }

    //大西洋视角中心
    function _AC(deg){
        return deg>180?deg-360:deg;
    }

    function fitViewportCalcZoom(){
        //使用太平洋视角缩放
        var leftP=360,topP=-90,rightP=0,bottomP=90;
        for(var key in pwaveItems){
            var item=pwaveItems[key];
            leftP=Math.min(leftP,_PC(item.center.atDistanceAndAzimuth(item.radius,270).longitude));
            topP=Math.max(topP,item.center.atDistanceAndAzimuth(item.radius,0).latitude);
            rightP=Math.max(rightP,_PC(item.center.atDistanceAndAzimuth(item.radius,90).longitude));
            bottomP=Math.min(bottomP,item.center.atDistanceAndAzimuth(item.radius,180).latitude);
        }
        //注意此处恢复为大西洋视角
        supplementMapView.visibleRegion=QtPositioning.rectangle(QtPositioning.coordinate(topP,_AC(leftP)),QtPositioning.coordinate(bottomP,_AC(rightP)));
        return supplementMapView.zoomLevel;
    }

    function fitViewportToEEWCircle(){
        //使用太平洋视角确定中心
        var leftP,topP,rightP,bottomP;
        //使用动画后不能像这样用即时属性去判断
        //while(true){
            if(mapView.zoomLevel<=3)
                return;
            var sumLongitude=0;
            for(var key in swaveItems){
                sumLongitude+=swaveItems[key].center.longitude;
            }
            var avgLongitude=sumLongitude/Object.keys(swaveItems).length;
            if(Math.abs(avgLongitude)>90){
                //使用太平洋视角中心
                leftP=360;
                rightP=0;
                topP=-90;
                bottomP=90;
                for(var key in swaveItems){
                    var item=swaveItems[key];
                    leftP=Math.min(leftP,_PC(item.center.atDistanceAndAzimuth(item.radius,270).longitude));
                    topP=Math.max(topP,item.center.atDistanceAndAzimuth(item.radius,0).latitude);
                    rightP=Math.max(rightP,_PC(item.center.atDistanceAndAzimuth(item.radius,90).longitude));
                    bottomP=Math.min(bottomP,item.center.atDistanceAndAzimuth(item.radius,180).latitude);
                }
                var tl=posToGeo(0,0);
                var br=posToGeo(mapView.width,mapView.height);
                if(leftP<_PC(tl.longitude)||topP>tl.latitude||rightP>_PC(br.longitude)||bottomP<br.latitude){
                    focusLocation((topP+bottomP)/2,_AC((leftP+rightP)/2),fitViewportCalcZoom()-0.25);
                //}else{
                    //break;
                }
            }else{
                //使用大西洋视角中心
                leftP=180;
                rightP=-180;
                topP=-90;
                bottomP=90;
                for(var key in swaveItems){
                    var item=swaveItems[key];
                    leftP=Math.min(leftP,_AC(item.center.atDistanceAndAzimuth(item.radius,270).longitude));
                    topP=Math.max(topP,item.center.atDistanceAndAzimuth(item.radius,0).latitude);
                    rightP=Math.max(rightP,_AC(item.center.atDistanceAndAzimuth(item.radius,90).longitude));
                    bottomP=Math.min(bottomP,item.center.atDistanceAndAzimuth(item.radius,180).latitude);
                }
                var tl=posToGeo(0,0);
                var br=posToGeo(mapView.width,mapView.height);
                if(leftP<tl.longitude||topP>tl.latitude||rightP>br.longitude||bottomP<br.latitude){
                    focusLocation((topP+bottomP)/2,(leftP+rightP)/2,fitViewportCalcZoom()-0.25);
                //}else{
                    //break;
                }
            }
        //}
    }

    function fitViewportEstimateCenterCalcZoom(){
        //使用太平洋视角缩放
        var leftP=360,topP=-90,rightP=0,bottomP=90;
        for(var i=0;i<yahooStationQMLItem.length;i++){
            var item=yahooStationQMLItem[i];
            if(item.shindo>=yahooStationMinDetectShindo){
                leftP=Math.min(leftP,_PC(item.coordinate.longitude));
                topP=Math.max(topP,item.coordinate.latitude);
                rightP=Math.max(rightP,_PC(item.coordinate.longitude));
                bottomP=Math.min(bottomP,item.coordinate.latitude);
            }
        }
        for(i=0;i<estimateQMLMarkList.length;i++){
            item=estimateQMLMarkList[i];
            leftP=Math.min(leftP,_PC(item.coordinate.longitude));
            topP=Math.max(topP,item.coordinate.latitude);
            rightP=Math.max(rightP,_PC(item.coordinate.longitude));
            bottomP=Math.min(bottomP,item.coordinate.latitude);
        }
        //注意此处恢复为大西洋视角
        supplementMapView.visibleRegion=QtPositioning.rectangle(QtPositioning.coordinate(topP,_AC(leftP)),QtPositioning.coordinate(bottomP,_AC(rightP)));
        return supplementMapView.zoomLevel;
    }

    function fitViewportToEstimateEpicenter(){
        //使用太平洋视角确定中心
        var leftP,topP,rightP,bottomP;
        //使用动画后不能像这样用即时属性去判断
        //while(true){
            if(mapView.zoomLevel<=3)
                return;
            var sumLongitude=0;
            for(var i=0;i<yahooStationQMLItem.length;i++){
                if(yahooStationQMLItem[i].shindo>=yahooStationMinDetectShindo)
                    sumLongitude+=yahooStationQMLItem[i].coordinate.longitude;
            }
            for(i=0;i<estimateQMLMarkList.length;i++){
                sumLongitude+=estimateQMLMarkList[i].coordinate.longitude;
            }
            var avgLongitude=sumLongitude/(yahooStationQMLItem.filter(e=>(e.shindo>=yahooStationMinDetectShindo)).length+estimateQMLMarkList.length);
            if(Math.abs(avgLongitude)>90){
                //使用太平洋视角中心
                leftP=360;
                rightP=0;
                topP=-90;
                bottomP=90;
                for(i=0;i<yahooStationQMLItem.length;i++){
                    var item=yahooStationQMLItem[i];
                    if(item.shindo>=yahooStationMinDetectShindo){
                        leftP=Math.min(leftP,_PC(item.coordinate.longitude));
                        topP=Math.max(topP,item.coordinate.latitude);
                        rightP=Math.max(rightP,_PC(item.coordinate.longitude));
                        bottomP=Math.min(bottomP,item.coordinate.latitude);
                    }
                }
                for(i=0;i<estimateQMLMarkList.length;i++){
                    item=estimateQMLMarkList[i];
                    leftP=Math.min(leftP,_PC(item.coordinate.longitude));
                    topP=Math.max(topP,item.coordinate.latitude);
                    rightP=Math.max(rightP,_PC(item.coordinate.longitude));
                    bottomP=Math.min(bottomP,item.coordinate.latitude);
                }
                var tl=posToGeo(0,0);
                var br=posToGeo(mapView.width,mapView.height);
                if(leftP<_PC(tl.longitude)||topP>tl.latitude||rightP>_PC(br.longitude)||bottomP<br.latitude){
                    focusLocationWithEstEpi((topP+bottomP)/2,_AC((leftP+rightP)/2),fitViewportEstimateCenterCalcZoom()-0.25,true);
                //}else{
                    //break;
                }
            }else{
                //使用大西洋视角中心
                leftP=180;
                rightP=-180;
                topP=-90;
                bottomP=90;
                for(i=0;i<yahooStationQMLItem.length;i++){
                    item=yahooStationQMLItem[i];
                    if(item.shindo>=yahooStationMinDetectShindo){
                        leftP=Math.min(leftP,_AC(item.coordinate.longitude));
                        topP=Math.max(topP,item.coordinate.latitude);
                        rightP=Math.max(rightP,_AC(item.coordinate.longitude));
                        bottomP=Math.min(bottomP,item.coordinate.latitude);
                    }
                }
                for(i=0;i<estimateQMLMarkList.length;i++){
                    item=estimateQMLMarkList[i];
                    leftP=Math.min(leftP,_AC(item.coordinate.longitude));
                    topP=Math.max(topP,item.coordinate.latitude);
                    rightP=Math.max(rightP,_AC(item.coordinate.longitude));
                    bottomP=Math.min(bottomP,item.coordinate.latitude);
                }
                tl=posToGeo(0,0);
                br=posToGeo(mapView.width,mapView.height);
                if(leftP<tl.longitude||topP>tl.latitude||rightP>br.longitude||bottomP<br.latitude){
                    focusLocationWithEstEpi((topP+bottomP)/2,(leftP+rightP)/2,fitViewportEstimateCenterCalcZoom()-0.25,true);
                //}else{
                    //break;
                }
            }
        //}
    }

    function updateLegendsSWave(){
        for(var i=0;i<12;i++){
            columnSWaveLegends.children[i].visible=false;
        }
        for(var key in swaveIntensities){
            if(swaveIntensities[key]>0)
                columnSWaveLegends.children[swaveIntensities[key]-1].visible=true;
        }
    }

    function setLabelLanguage(language){
        var fontName=["Sarasa Mono SC","Sarasa Mono SC","Sarasa Mono TC","Sarasa Mono J"];
        textHome.font.family=fontName[language];
        textRed.font.family=fontName[language];
        textCross.font.family=fontName[language];
        textSwaveArrivingIn.font.family=fontName[language];
        textEEWTime.font.family=fontName[language];
        textNIEDTime.font.family=fontName[language];
        textLegendIntensity.font.family=fontName[language];
        textLegendShindo.font.family=fontName[language];
        textLegendPWave.font.family=fontName[language];
        textLegendSWave.font.family=fontName[language];
        textWarnInfoTitle.font.family=fontName[language];
        textWarnInfoContent.font.family=fontName[language];
        //textCheckLockView.font.family=fontName[language];
        //textCheckNoAnimation.font.family=fontName[language];
        for(var i=0;i<12;i++){
            columnLegendIntensities.children[i].children[1].font.family=fontName[language];
        }
        for(var i=0;i<21;i++){
            columnLegendShindos.children[i].children[1].font.family=fontName[language];
        }
    }

    property var eventIdList: []

    function addHeadBar(eventId){
        //columnHeads.visible=true;
        columnCounter.visible=true;
        //根据 https://doc.qt.io/qt-5/qtqml-javascript-dynamicobjectcreation.html 的文档，创建是有可能直接就完成的
        var compHead=Qt.createComponent("rectanglehead"+(checkOldEewHead.checked?"_original.qml":".qml"),Component.Asynchronous);
        if(compHead.status===Component.Ready){
            var oHead=compHead.createObject(columnHeads);
            oHead.setFontFamily(textEEWTime.font.family);
        }else{
            compHead.statusChanged.connect(()=>{
                if(compHead.status===Component.Ready){
                    var oHead=compHead.createObject(columnHeads);
                    oHead.setFontFamily(textEEWTime.font.family);
                }
            });
        }
        var compCounter=Qt.createComponent("rowcounter.qml",Component.Asynchronous);
        if(compCounter.status===Component.Ready){
            var oCounter=compCounter.createObject(columnListCounters);
            oCounter.setFontFamily(textEEWTime.font.family);
        }else{
            compCounter.statusChanged.connect(()=>{
                if(compCounter.status===Component.Ready){
                    var oCounter=compCounter.createObject(columnListCounters);
                    oCounter.setFontFamily(textEEWTime.font.family);
                }
            });
        }
        eventIdList.push(eventId);
    }

    function removeHeadBar(eventId){
        var indexEventId=eventIdList.indexOf(eventId);
        eventIdList.splice(indexEventId,1);
        //调用destroy后，其所在父级容器会自动清理该obj，所以不用再管理父级的children列表清理
        columnHeads.children[indexEventId].destroy();
        columnListCounters.children[indexEventId].destroy();
        if(eventIdList.length<=0){
            //columnHeads.visible=false;
            columnCounter.visible=false;
        }
    }

    function setHeadBar(eventId,intensity,localint,location,timeStr,magnitude,depth,counterSec,updateNumber,iNumber){
        var indexEventId=eventIdList.indexOf(eventId);
        if(indexEventId===-1){
            indexEventId=eventIdList.length;
            addHeadBar(eventId);
        }
        var colorInt=Math.min(Math.max(0,intensity),12);
        var colorLocalInt=Math.min(Math.max(0,localint),12);
        var hb=columnHeads.children[indexEventId];
        if (hb!==undefined&&hb!==null){
            hb.setHeadBar(intensity,location,timeStr,magnitude,depth,
                          updateNumber,iNumber,
                          getIntTextColors(colorInt),getIntColors(colorInt),
                          eventIdList.length);
        }
        var ct=columnListCounters.children[indexEventId];
        if (ct!==undefined&&ct!==null){
            ct.setCounter(counterSec,localint,
                          getIntTextColors(colorLocalInt),
                          getIntColors(colorLocalInt),
                          iNumber,eventIdList.length);
        }
    }

    property real msEEWTime: 0

    function updateEEWTime(milliseconds,fmtText){
        msEEWTime=milliseconds;
        textEEWTime.color="white";
        if(checkShowNiedStations.checked)
            textEEWTime.text="EEW: "+fmtText.split(" ").pop();
        else
            textEEWTime.text=fmtText;
    }

    function updateNIEDTime(sec){
        yahooStationRealtimeDataTimestampSec=sec;
        if(yahooPlaybackDeltaSec===0){
            textNIEDTime.color="white";
        }
        textNIEDTime.text="NIED: "+new Date(sec*1000).toTimeString().substr(0,8);
    }

    //0-12
    function getIntColors(index){
        const intColors=["white","#9bc4e4","#00a0f1","#0062f5",
                       "#46bc67","#12994e","#f6b72d","#ff8400","#fa5151",
                       "#f4440d","#ff000d","#c20007","#fd2fc2"];
        return intColors[index];
    }

    function getIntLineColor(index){
        const colors=["white","#00A3FF","#00C9FF","#00A3FF",
                           "#00FF6E","#00FF6E","#FFEB00","#FFEB00","#D0001B",
                           "#D0001B","#CC1B00","#F900FF","#FD9AFF"];
        return colors[index];
    }

    function getIntTextColors(index){
        const intTextColors=["black","black","white","white",
                           "white","white","black","black","white",
                           "white","white","white","white",];
        return intTextColors[index];
    }

    function debugInspect(){
        debugText.text="mapView.mapItems:"+mapView.mapItems.length+
                "\neewItems:"+Object.keys(eewItems).length+
                "\nhistoryItems:"+historyItems.length+
                "\npwaveItems:"+Object.keys(pwaveItems).length+
                "\nswaveItems:"+Object.keys(swaveItems).length+
                "\nbarItems:"+Object.keys(barItems).length;
    }

    function getMapIntensitySource(intensity){
        var src=[null,
                mapIntensity1Source,
                mapIntensity2Source,
                mapIntensity3Source,
                mapIntensity4Source,
                mapIntensity5Source,
                mapIntensity6Source,
                mapIntensity7Source,
                mapIntensity8Source,
                mapIntensity9Source,
                mapIntensity10Source,
                mapIntensity11Source,
                mapIntensity12Source];
        return src[intensity];
    }

    property real intLeftLon: 999.0
    property real intRightLon: 999.0
    property real intTopLat: 999.0
    property real intBottomLat: 999.0
    property real intFirstLon: 999.0

    function clearGeoItems(){
        for(var i=1;i<=12;i++){
            getMapIntensitySource(i).data=emptyGeoJson;
        }
        intLeftLon=intRightLon=intTopLat=intBottomLat=intFirstLon=999.0;
    }

    function addGeoItem(intensity,arrGeoPolygon){
        var mapSource=getMapIntensitySource(intensity);//通过.data设置geojson数据显示
        if(mapSource===null)
            return;
        //把cGeoPolygon转换成geojson格式
        var mps=[];
        for(var gp of arrGeoPolygon){
            var ps=[];
            for(var coord of gp.perimeter){//list<coord>
                ps.push([coord.longitude,coord.latitude]);
                //同时计算边界经纬度
                if(intTopLat===999.0){
                    intTopLat=intBottomLat=coord.latitude;
                    intFirstLon=intLeftLon=intRightLon=coord.longitude;
                }
                intTopLat=Math.max(intTopLat,coord.latitude);
                intBottomLat=Math.min(intBottomLat,coord.latitude);
                if(calcDeltaLon(coord.longitude,intFirstLon)>calcDeltaLon(intRightLon,intFirstLon))
                    intRightLon=coord.longitude;
                if(calcDeltaLon(intFirstLon,coord.longitude)>calcDeltaLon(intFirstLon,intLeftLon))
                    intLeftLon=coord.longitude;
            }
            mps.push(ps);
        }
        var geojson={type:"FeatureCollection",features:[{type:"Feature",geometry:{type:"MultiPolygon",coordinates:[mps]}}]};
        mapSource.data=JSON.stringify(geojson);
    }

    function refreshIntensityPolygons(){
        //Nothing
    }

    function calcDeltaLon(lon1,lon2){
        //https://zhidao.baidu.com/question/2208834735667520028.html
        var r=lon2-lon1;
        if(r>180)
            r=r-360;
        else if(r<-180)
            r=r+360;
        return r;
    }

    function fitIntensityPolygons(epiLat,epiLon,epiInt){
        if(intFirstLon===999.0)
            return;
        supplementMapView.clearMapItems();
        var supGeoItem=Qt.createQmlObject("import QtLocation 5.14;MapPolygon{}",supplementMapView);
        supGeoItem.path=[QtPositioning.coordinate(intBottomLat,intLeftLon),
                        QtPositioning.coordinate(intTopLat,intLeftLon),
                        QtPositioning.coordinate(intTopLat,intRightLon),
                        QtPositioning.coordinate(intBottomLat,intRightLon)];
        supplementMapView.addMapItem(supGeoItem);
        //显示烈度的时候把震源也显示出来
        var epiItem=Qt.createQmlObject('import QtLocation 5.14; MapQuickItem {}',supplementMapView);
        var img=Qt.createQmlObject('import QtQuick 2.14; Image{}',supplementMapView);
        img.width=img.height=(3+1.5*Math.exp(0.25*epiInt))*5;
        img.source=(runningOS==="Android"?'assets:Media/red.svg':'file:Media/red.svg');
        epiItem.anchorPoint.x=img.width/2;
        epiItem.anchorPoint.y=img.height/2;
        epiItem.sourceItem=img;
        epiItem.coordinate=QtPositioning.coordinate(epiLat,epiLon);
        supplementMapView.addMapItem(epiItem);

        supplementMapView.fitViewportToMapItems();
        focusLocation(supplementMapView.center.latitude,supplementMapView.center.longitude,supplementMapView.zoomLevel);
        supplementMapView.clearMapItems();
    }

    function resizeStationItemsCount(count){
        if(stationItems.length>count){
            var removedItems=stationItems.splice(count,stationItems.length-count);
            for(var item of removedItems){
                stationMarkMapView.removeMapItem(item);
                item.destroy();
            }
        }else{
            while(stationItems.length<count){
                var rcItem=Qt.createQmlObject('import QtQuick 2.14; Rectangle{}',stationMarkMapView);
                var intensityRcItemNew=Qt.createQmlObject('import QtQuick 2.14; Rectangle{}',stationMarkMapView);
                var intensityTextItemNew=Qt.createQmlObject('import QtQuick 2.14; Text{}',stationMarkMapView);
                var textItemNew=Qt.createQmlObject('import QtQuick 2.14; Text{visible:mapView.zoomLevel>=5}',stationMarkMapView);
                var stationItem=Qt.createQmlObject('import QtLocation 5.14; MapQuickItem {}',stationMarkMapView);
                intensityRcItemNew.border.color='white';
                intensityRcItemNew.border.width=2;
                intensityTextItemNew.font.family=textEEWTime.font.family;
                intensityTextItemNew.font.bold=true;
                intensityTextItemNew.anchors.verticalCenter=intensityRcItemNew.verticalCenter;
                intensityTextItemNew.anchors.horizontalCenter=intensityRcItemNew.horizontalCenter;
                rcItem.anchors.verticalCenter=intensityRcItemNew.verticalCenter;
                rcItem.anchors.horizontalCenter=intensityRcItemNew.horizontalCenter;
                textItemNew.font.family=textEEWTime.font.family;
                textItemNew.font.pixelSize=14;
                textItemNew.style=Text.Outline;
                textItemNew.font.bold=true;
                textItemNew.color='white';
                textItemNew.anchors.horizontalCenter=intensityRcItemNew.horizontalCenter;
                textItemNew.anchors.top=intensityRcItemNew.bottom;
                rcItem.children.push(intensityRcItemNew);
                rcItem.children.push(intensityTextItemNew);
                rcItem.children.push(textItemNew);
                stationItem.anchors.verticalCenter=rcItem.verticalCenter;
                stationItem.anchors.horizontalCenter=rcItem.horizontalCenter;
                stationItem.sourceItem=rcItem;
                stationItems.push(stationItem);
                stationMarkMapView.addMapItem(stationItem);
            }
        }
    }

    function setStationItem(index,longitude,latitude,intensity,name){
        if(index>=stationItems.length)
            return;
        var rectItem=stationItems[index].sourceItem;
        var intensityRcItem=rectItem.children[0];
        var intensityTextItem=rectItem.children[1];
        var textItem=rectItem.children[2];
        intensityRcItem.width=intensityRcItem.height=(3+1.5*Math.exp(0.25*intensity))*5;
        intensityRcItem.color=getIntColors(intensity);
        intensityTextItem.font.pixelSize=intensityRcItem.height*0.8;
        intensityTextItem.color=getIntTextColors(intensity);
        intensityTextItem.text=intensity;
        textItem.text=name;
        textItem.y=intensityRcItem.height/2;
        stationItems[index].anchorPoint.x=intensityRcItem.width/2;
        stationItems[index].anchorPoint.y=intensityRcItem.height/2;
        stationItems[index].coordinate=QtPositioning.coordinate(latitude,longitude);
    }

    function focusShakingStation(shakingIntensity,maxZoomLevel){
        supplementMapView.clearMapItems();
        for(var i=0;i<stationItems.length;i++){
            //因为MapQuickItem没法直接添加属性暂时只能这样
            if(stationItems[i].sourceItem.children[1].text>=shakingIntensity){
                var qItem=Qt.createQmlObject('import QtLocation 5.14; MapQuickItem {}',supplementMapView);
                var ircItem=Qt.createQmlObject('import QtQuick 2.14; Rectangle{}',supplementMapView);
                ircItem.border.color='white';
                ircItem.border.width=2;
                ircItem.width=ircItem.height=stationItems[i].sourceItem.children[0].height;
                qItem.anchorPoint.x=ircItem.width/2;
                qItem.anchorPoint.y=ircItem.height/2;
                qItem.sourceItem=ircItem;
                qItem.coordinate=stationItems[i].coordinate;
                supplementMapView.addMapItem(qItem);
            }
        }
        if(supplementMapView.mapItems.length>0){
            supplementMapView.fitViewportToMapItems();
            focusLocation(supplementMapView.center.latitude,supplementMapView.center.longitude,Math.min(supplementMapView.zoomLevel,maxZoomLevel));
            supplementMapView.clearMapItems();
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
