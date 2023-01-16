import QtQuick
import QtQuick.Controls.Basic

ComboBox {

    background: Rectangle {
        implicitWidth: 56
        implicitHeight: 24
        radius: 2
        border.color: "darkgrey"
    }

    contentItem: Text {
        text: parent.displayText
        color: "darkgrey"
        rightPadding: 8
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        x: 46
        y: 10
        width: 4
        height: width
        radius: width / 2
        color: "darkgrey"
    }
}