import QtQuick 2.14

Rectangle{
    id: rectangleHead
    width: headRow.width+10
    height: headRow.height+10
    color: "#80666666"
    Row {
        id: headRow
        x: 5
        y: 5
        spacing: 4
        Rectangle{
            id: rectangleIntensity
            anchors.verticalCenter: parent.verticalCenter
            width: 54
            height: 54
            color: "#3bcdff"
            border.color: "white"
            Text {
                id: headIntensity
                text: "00"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.pixelSize: 48
            }
        }

        Column {
            width: rowDetail.width
            Text {
                id: headLocation
                text: "Location Location"
                width: parent.width
                color: "#ffffff"
                wrapMode: Text.NoWrap
                font.bold: true
                font.pixelSize: 28
                transform: Scale{
                    id: scaleHeadLocation
                    xScale: Math.min(1,headLocation.width/headLocation.contentWidth)
                }
                style: Text.Outline
            }

            Row {
                id: rowDetail
                Text {
                    id: headMagnitude
                    width: 56
                    text: "M0.0"
                    font.bold: true
                    font.pixelSize: 24
                    color: "#ffffff"
                    style: Text.Outline
                    anchors.bottom: parent.bottom
                }

                Text {
                    id: headDepth
                    width: 68
                    text: "000km"
                    horizontalAlignment: Text.AlignRight
                    font.bold: true
                    font.pixelSize: 24
                    color: "#ffffff"
                    style: Text.Outline
                    anchors.bottom: parent.bottom
                }

                Text {
                    id: headTimeStr
                    color: "#ffffff"
                    text: "0000-00-00 00:00:00"
                    font.bold: true
                    font.pixelSize: 16
                    style: Text.Outline
                    anchors.bottom: parent.bottom
                    leftPadding: 20
                }
            }
        }
    }
    function setFontFamily(name){
        //必须逐个单独设置，直接设置父级控件是不起作用的
        headIntensity.font.family=name;
        headLocation.font.family=name;
        headTimeStr.font.family=name;
        headMagnitude.font.family=name;
        headDepth.font.family=name;
    }
    function setHeadBar(intensity,location,timeStr,magnitude,depth,updateNumber,iNumber,fColor,bColor,totalNumber){
        headIntensity.text=intensity;
        headIntensity.color=fColor;
        rectangleIntensity.color=bColor;
        rectangleIntensity.border.width=intensity<=0?1:0;
        //注意iNumber是从1开始的
        headLocation.text="%1%2 #%3".arg(totalNumber>1?String.fromCharCode(9311+iNumber)+" ":"").arg(location).arg(updateNumber);

        headTimeStr.text=timeStr;
        headMagnitude.text="M%1".arg(magnitude);
        headDepth.text="%1km".arg(depth);
    }
}
