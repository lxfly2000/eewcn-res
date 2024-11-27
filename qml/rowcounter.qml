import QtQuick 2.14

Row{
    anchors.right: parent.right
    Rectangle{
        id:rectangleNumber
        width: textCounterNumber.width
        height: textCounterNumber.height
        color: "transparent"
        Text{
            id:textCounterNumber
            text: "#1"
            color: "#ffffff"
            font.bold: true
            style: Text.Outline
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle{
        id: rectangleLocalIntensity
        border.color: "white"
        width: 54
        height: textLocalIntensity.height
        Text{
            id: textLocalIntensity
            text: "00"
            font.bold: true
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangleCounter
        width: textCounter.width+10
        height: textCounter.height
        color: "#80666666"

        Text {
            id: textCounter
            color: "#ffffff"
            text: "0:00"
            style: Text.Normal
            styleColor: "#ffffff"
            font.bold: true
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    function setFontFamily(name){
        textCounter.font.family=name;
        textLocalIntensity.font.family=name;
        textCounterNumber.font.family=name;
    }
    function setCounter(counterSec,localint,fColor,bColor,iNumber,totalNumber){
        counterSec=Math.max(0,counterSec);
        var sSec="%1".arg(counterSec%60);
        if(sSec.length<2)
            sSec="0"+sSec;
        textCounter.color=counterSec>10?"yellow":"red";
        textCounter.style=counterSec>10?Text.Normal:Text.Outline;
        textCounter.text=Math.floor(counterSec/60)+":"+sSec;
        rectangleLocalIntensity.color=bColor;
        rectangleLocalIntensity.border.width=localint<=0?1:0;
        textLocalIntensity.text=localint;
        textLocalIntensity.color=fColor;
        rectangleNumber.visible=totalNumber>1;
        //注意iNumber是从1开始的
        textCounterNumber.text=String.fromCharCode(9311+iNumber);
    }
}
