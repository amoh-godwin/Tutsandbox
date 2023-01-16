import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Button {
    text: ">"

    background: Rectangle {
        implicitHeight: 36
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.7): Qt.rgba(255, 255, 255, 0.5)
    }

    contentItem: Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: parent.text
        font.family: segoe_icon.name
        font.pixelSize: 15
    }
}
