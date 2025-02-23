import QtQuick 2.14
import QtLocation 5.15
import QtPositioning 5.15

Item {
    visible: true
    function getWindowZoom(){
        return height/480;//假定初始QML窗口大小为640*480
    }
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
            name: "mapboxgl"
            PluginParameter{
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
            }
        }

        MapParameter {
            id:mapIntensity1Source
            type: "source"
            property string name: "intensity1Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity1Layer"
            property string layerType: "fill"
            property string source: "intensity1Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity1Layer"
            property var fillColor: getIntColors(1)
        }
        MapParameter {
            id:mapIntensity2Source
            type: "source"
            property string name: "intensity2Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity2Layer"
            property string layerType: "fill"
            property string source: "intensity2Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity2Layer"
            property var fillColor: getIntColors(2)
        }
        MapParameter {
            id:mapIntensity3Source
            type: "source"
            property string name: "intensity3Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity3Layer"
            property string layerType: "fill"
            property string source: "intensity3Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity3Layer"
            property var fillColor: getIntColors(3)
        }
        MapParameter {
            id:mapIntensity4Source
            type: "source"
            property string name: "intensity4Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity4Layer"
            property string layerType: "fill"
            property string source: "intensity4Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity4Layer"
            property var fillColor: getIntColors(4)
        }
        MapParameter {
            id:mapIntensity5Source
            type: "source"
            property string name: "intensity5Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity5Layer"
            property string layerType: "fill"
            property string source: "intensity5Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity5Layer"
            property var fillColor: getIntColors(5)
        }
        MapParameter {
            id:mapIntensity6Source
            type: "source"
            property string name: "intensity6Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity6Layer"
            property string layerType: "fill"
            property string source: "intensity6Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity6Layer"
            property var fillColor: getIntColors(6)
        }
        MapParameter {
            id:mapIntensity7Source
            type: "source"
            property string name: "intensity7Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity7Layer"
            property string layerType: "fill"
            property string source: "intensity7Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity7Layer"
            property var fillColor: getIntColors(7)
        }
        MapParameter {
            id:mapIntensity8Source
            type: "source"
            property string name: "intensity8Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity8Layer"
            property string layerType: "fill"
            property string source: "intensity8Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity8Layer"
            property var fillColor: getIntColors(8)
        }
        MapParameter {
            id:mapIntensity9Source
            type: "source"
            property string name: "intensity9Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity9Layer"
            property string layerType: "fill"
            property string source: "intensity9Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity9Layer"
            property var fillColor: getIntColors(9)
        }
        MapParameter {
            id:mapIntensity10Source
            type: "source"
            property string name: "intensity10Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity10Layer"
            property string layerType: "fill"
            property string source: "intensity10Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity10Layer"
            property var fillColor: getIntColors(10)
        }
        MapParameter {
            id:mapIntensity11Source
            type: "source"
            property string name: "intensity11Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity11Layer"
            property string layerType: "fill"
            property string source: "intensity11Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity11Layer"
            property var fillColor: getIntColors(11)
        }
        MapParameter {
            id:mapIntensity12Source
            type: "source"
            property string name: "intensity12Source"
            property string sourceType: "geojson"
            property string data: emptyGeoJson
        }
        MapParameter {
            type: "layer"
            property string name: "intensity12Layer"
            property string layerType: "fill"
            property string source: "intensity12Source"
            //指该层应在哪层之下
            property string before: "admin-3-4-boundaries-bg"
        }
        MapParameter {
            type: "paint"
            property string layer: "intensity12Layer"
            property var fillColor: getIntColors(12)
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

        Text {
            id: textEEWTime
            color: "red"
            text: "0000-00-00 00:00:00"
            font.pixelSize: 14
            font.bold: true
            anchors.right: parent.right
            style: Text.Outline
        }
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
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(12)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "12"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(11)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "11"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(10)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "10"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(9)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "9"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(8)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "8"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(7)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "7"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(6)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "6"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(5)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "5"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(4)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "4"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(3)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "3"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(2)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "2"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row{
                spacing: 2
                Rectangle{
                    width: 20
                    height: 20
                    color: getIntColors(1)
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "1"
                    color: "white"
                    style: Text.Outline
                    font.pixelSize: 14
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
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
                        source: "file:Media/green.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
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
                        source: "file:Media/red.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
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
                        source: "file:Media/cross.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
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
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(1).substr(1)
                            border.color: getIntLineColor(1)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(2).substr(1)
                            border.color: getIntLineColor(2)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(3).substr(1)
                            border.color: getIntLineColor(3)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(4).substr(1)
                            border.color: getIntLineColor(4)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(5).substr(1)
                            border.color: getIntLineColor(5)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(6).substr(1)
                            border.color: getIntLineColor(6)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(7).substr(1)
                            border.color: getIntLineColor(7)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(8).substr(1)
                            border.color: getIntLineColor(8)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(9).substr(1)
                            border.color: getIntLineColor(9)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(10).substr(1)
                            border.color: getIntLineColor(10)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(11).substr(1)
                            border.color: getIntLineColor(11)
                            border.width: 1
                        }
                        Rectangle{
                            width: 20
                            height: 20
                            radius: 10
                            color: '#55'+getIntColors(12).substr(1)
                            border.color: getIntLineColor(12)
                            border.width: 1
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
        id:rectWarnInfo
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 8
        anchors.topMargin: 8
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
        onTriggered: {
            if(Date.now()-msEEWTime>5000){
                textEEWTime.color="red";
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
            font.family:"Sarasa Gothic SC";color:"yellow"
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
            font.family:"Sarasa Gothic SC"
            style:Text.Outline
            anchors.horizontalCenter:parent.horizontalCenter
            visible:false
        }
    }

    function showWarningCenter(bVisible,sText){
        rectangleWarnInfoCenter.visible=bVisible;
        textWarnInfoCenter.text=sText;
    }

    function setMapboxParam(a,s){
        if(a==="pk.eyJ1IjoibHhmbHkyMDAwIiwiYSI6ImNrcHMwenM2ZzAyeWUydXM0dWE5aGs0cjgifQ.h_6WnVVn5tltXvJRI8BK1g"){
            a="pk.eyJ1IjoibHhmbHkyMDAwIiwiYSI6ImNtNjlkdWZ2ZDA5N2cya3F1OGw2b3ZseDkifQ.LpSPrjVvQwUAOgfrzaVAqg";
            //检查Token是否可检索Style
            var xhr=new XMLHttpRequest();
            var stylePath=s.substr(s.indexOf("/styles/")+8);
            xhr.open("GET","https://api.mapbox.com/styles/v1/"+stylePath+"?access_token="+a,true);
            xhr.onreadystatechange=function(){
                if(xhr.readyState===4&&xhr.status===200){
                    mapboxAccessToken.value=a;
                    mapboxStyle.value=s;
                    showWarningCenter(false,"");
                }else{
                    showWarningCenter(true,"程序内置的Mapbox Token暂时不可用，\n请更换Token.\n"+
                        "The built-in Mapbox token is currently unavailable,\nplease use another token.\n"+
                        "ご使用中の内蔵Mapbox Tokenは現在利用できません。\n別のTokenに交換してください。");
                }
            }
            xhr.send();
        }else{
            mapboxAccessToken.value=a;
            mapboxStyle.value=s;
            showWarningCenter(false,"");
        }
    }

    function setMapboxLogoVisible(v){
        mapView.copyrightsVisible=v;
        columnLegends.anchors.bottomMargin=v?25:2;
    }

    function clearEEWMarks(){
        eewMarkMapView.clearMapItems();
        eewItems={};
    }

    function clearHistoryMarks(){
        historyMarkMapView.clearMapItems();
        historyItems=[];
    }

    function setHome(latitude,longitude){
        if(homeItem===null){
            homeItem=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                        'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                        'sourceItem:Image{id:img;width:50;height:50;source:"file:Media/green.svg"}}',homeMarkMapView);
            homeMarkMapView.addMapItem(homeItem);
        }
        homeItem.coordinate=QtPositioning.coordinate(latitude,longitude);
    }

    function putEEWMark(eventId,latitude,longitude,intensity){
        var sl=(3+1.5*Math.exp(0.25*intensity))*5;
        //注意此处应合并为一个脚本创建，否则会有释放不掉的问题
        var item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                    'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                    'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"file:Media/cross.svg"}}',eewMarkMapView);
        item.coordinate=QtPositioning.coordinate(latitude,longitude);
        item.visible=!eewMarksTimer.running;
        eewItems[eventId]=item;
        eewMarkMapView.addMapItem(item);
    }

    function putHistoryMark(latitude,longitude,intensity){
        var sl=(3+1.5*Math.exp(0.25*intensity))*5;
        //注意此处应合并为一个脚本创建，否则会有释放不掉的问题
        var item=Qt.createQmlObject('import QtLocation 5.14;import QtQuick 2.14;'+
                                    'MapQuickItem {anchorPoint.x:img.width/2;anchorPoint.y:img.height/2;'+
                                    'sourceItem:Image{id:img;width:'+sl+';height:'+sl+';source:"file:Media/red.svg"}}',historyMarkMapView);
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
        animMapLatitude.to=latitude;
        animMapLongitude.to=longitude;
        animMapZoomLevel.to=zoom;
        animMapLatitude.start();
        animMapLongitude.start();
        animMapZoomLevel.start();
    }

    function refreshMarks(){
        refreshIntensityPolygons();
        eewCircleMapView.clearMapItems();
        for(var item in pwaveItems){
            eewCircleMapView.addMapItem(pwaveItems[item]);
        }
        for(item in swaveItems){
            for(var sii=0;sii<swaveItemsGradientsSize;sii++){
                eewCircleMapView.addMapItem(swaveItems[item][sii]);
            }
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
    }

    property var swaveItemsGradientsSize: 50
    property var swaveItemsGradientsPixelDistance: 150 //所有渐变的累计像素宽度

    function setEEWCircle(eventId,latitude,longitude,depth,elapsedMilliseconds,radiusPwave,radiusSwave,intensity,iNumber){
        var sii=0;
        //iNumber用于有多个震源时显示标号，但根据国内的地震速报情况来看，感觉暂时用不到
        if(pwaveItems[eventId]===undefined){
            pwaveItems[eventId]=Qt.createQmlObject('import QtLocation 5.14; MapCircle {}',eewCircleMapView);
            pwaveItems[eventId].color='transparent';//填充色
            pwaveItems[eventId].border.color='white';//边线色，对mapboxgl貌似不起作用
            pwaveItems[eventId].border.width=1;//边线宽，对mapboxgl貌似不起作用
            eewCircleMapView.addMapItem(pwaveItems[eventId]);
        }
        if(swaveItems[eventId]===undefined){
            var swaveItemGradients=[]
            for(sii=0;sii<swaveItemsGradientsSize;sii++){
                var item=Qt.createQmlObject('import QtLocation 5.14; MapCircle {}',eewCircleMapView);
                item.border.width=3;//边线宽，对mapboxgl貌似不起作用
                item.color='transparent';
                eewCircleMapView.addMapItem(item);
                swaveItemGradients.push(item);
            }
            swaveItems[eventId]=swaveItemGradients;
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
        numTextItem.text=String.fromCharCode(9312+eventIdList.indexOf(eventId));
        numberItems[eventId].anchorPoint.x=numTextItem.width/2;
        numberItems[eventId].anchorPoint.y=numTextItem.height/2+50*getWindowZoom();
        numberItems[eventId].coordinate=QtPositioning.coordinate(latitude,longitude);

        swaveIntensities[eventId]=intensity;
        //swaveItems[eventId].color=intensity===0?'transparent':'#55'+getIntColors(intensity).substr(1);//填充色
        for(sii=0;sii<swaveItemsGradientsSize;sii++){
            if(sii===0){
                swaveItems[eventId][sii].border.color=getIntLineColor(intensity);//边线色，对mapboxgl貌似不起作用
            }else{
                swaveItems[eventId][sii].border.color='#55'+getIntColors(intensity).substr(1);//填充色
            }
            swaveItems[eventId][sii].opacity=(swaveItemsGradientsSize-sii)/swaveItemsGradientsSize;
        }
        if(radiusSwave<0){
            if(barItems[eventId]===undefined){
                var item=Qt.createQmlObject('import QtLocation 5.14; MapQuickItem {scale:getWindowZoom()}',numberBarMapView);
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
            delete barItems[eventId];
        }

        pwaveItems[eventId].center=QtPositioning.coordinate(latitude,longitude);
        pwaveItems[eventId].radius=Math.max(0,radiusPwave*1000);//单位米，涉及参数较多，在C++中运算
        for(sii=0;sii<swaveItemsGradientsSize;sii++){
            swaveItems[eventId][sii].center=pwaveItems[eventId].center;
            if(sii===0){
                swaveItems[eventId][sii].radius=Math.max(0,radiusSwave*1000);//单位米，涉及参数较多，在C++中运算
            }else{
                var centerCoord=QtPositioning.coordinate(latitude,longitude);
                var distantCoord=centerCoord.atDistanceAndAzimuth(100*1000,90);
                var centerPos=geoToPos(latitude,longitude);
                var distantPos=geoToPos(distantCoord.latitude,distantCoord.longitude);
                //100公里在震中点的X轴上的像素长度是abs(centerPos.x-distantPos.x)
                var surfaceAllGradientDistance=swaveItemsGradientsPixelDistance*100/Math.abs(centerPos.x-distantPos.x);
                var surfaceEachGradientDistance=surfaceAllGradientDistance/swaveItemsGradientsSize;
                swaveItems[eventId][sii].radius=Math.max(0,(radiusSwave-sii*surfaceEachGradientDistance)*1000);
            }
        }
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
        delete pwaveItems[eventId];
        for(var sii=0;sii<swaveItemsGradientsSize;sii++){
            eewCircleMapView.removeMapItem(swaveItems[eventId][sii]);
        }
        delete swaveItems[eventId];
        delete swaveIntensities[eventId];
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

    function _PC(deg){
        return deg<0?deg+360:deg;
    }

    function _AC(deg){
        return deg>180?deg-360:deg;
    }

    function fitViewportCalcZoom(){
        var leftP=360,topP=-90,rightP=0,bottomP=90;
        for(var key in pwaveItems){
            var item=pwaveItems[key];
            leftP=Math.min(leftP,_PC(item.center.atDistanceAndAzimuth(item.radius,270).longitude));
            topP=Math.max(topP,item.center.atDistanceAndAzimuth(item.radius,0).latitude);
            rightP=Math.max(rightP,_PC(item.center.atDistanceAndAzimuth(item.radius,90).longitude));
            bottomP=Math.min(bottomP,item.center.atDistanceAndAzimuth(item.radius,180).latitude);
        }
        supplementMapView.visibleRegion=QtPositioning.rectangle(QtPositioning.coordinate(topP,leftP),QtPositioning.coordinate(bottomP,rightP));
        return supplementMapView.zoomLevel;
    }

    function fitViewportToEEWCircle(){
        var leftP,topP,rightP,bottomP;
        //使用动画后不能像这样用即时属性去判断
        //while(true){
            if(mapView.zoomLevel<=3)
                return;
            leftP=360;
            rightP=0;
            topP=-90;
            bottomP=90;
            for(var key in swaveItems){
                var item=swaveItems[key][0];
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
        textLegendIntensity.font.family=fontName[language];
        textLegendPWave.font.family=fontName[language];
        textLegendSWave.font.family=fontName[language];
        textWarnInfoTitle.font.family=fontName[language];
        textWarnInfoContent.font.family=fontName[language];
        for(var i=0;i<12;i++){
            columnLegendIntensities.children[i].children[1].font.family=fontName[language];
        }
    }

    property var eventIdList: []

    function addHeadBar(eventId){
        //columnHeads.visible=true;
        columnCounter.visible=true;
        //根据 https://doc.qt.io/qt-5/qtqml-javascript-dynamicobjectcreation.html 的文档，创建是有可能直接就完成的
        var compHead=Qt.createComponent("https://lxfly2000.github.io/eewcn-res/qml/rectanglehead.qml",Component.Asynchronous);
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
        var compCounter=Qt.createComponent("https://lxfly2000.github.io/eewcn-res/qml/rowcounter.qml",Component.Asynchronous);
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
        textEEWTime.text=fmtText;
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
        img.source='file:Media/red.svg';
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
