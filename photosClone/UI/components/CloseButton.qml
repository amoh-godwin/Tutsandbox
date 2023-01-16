import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Button {

    background: Rectangle {
        implicitWidth: 46
        implicitHeight: 28
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.1): "transparent"
    }

    contentItem: Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: parent.text
        font.family: segoe_icon.name
        font.pixelSize: 10
        color: "white"
    }
}
