import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 2048
    height: 1536
    title: qsTr("diyDrive_simple_clock")

    Image {
        source: "images/background.png"
    }

    Rectangle {
        id: h
        x: 1022.5
        y: 350
        height: 300
        width: 3

        color: "#D1D1D1"
        radius: 3

        transform: Rotation {
            id: hRot
            origin.x: 1.5
            origin.y: 300
            angle: 97
        }
    }

    Rectangle {
        id: m
        x: 1022.5
        y: 100
        height: 550
        width: 3

        color: "#D1D1D1"
        radius: 3

        transform: Rotation {
            id: mRot
            origin.x: 1.5
            origin.y: 550
            angle: 0
        }
    }

    Rectangle {
        id: s
        x: 1022.5
        y: 200
        height: 450
        width: 3

        color: "#60D1D1D1"
        radius: 3

        transform: Rotation {
            id: sRot
            origin.x: 1.5
            origin.y: 450
            angle: 0
        }
    }

    Timer {
        interval: 10
        running: true
        repeat: true
        onTriggered: updateTime()
    }

    function updateTime() {
        var date = new Date();
        var ms = date.getTime();

        var s = ms / 1000;
        var m = (s / 60) - date.getTimezoneOffset();
        var h = m / 60;

        s %= 60;
        s = s.toFixed(0);
        m %= 60;
        h %= 12;

        hRot.angle = (h / 12) * 360;
        mRot.angle = (m / 60) * 360;
        sRot.angle = (s / 60) * 360;
    }

    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width
}
