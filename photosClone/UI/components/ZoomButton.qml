import QtQuick
import QtQuick.Controls.Universal

Button {
    background: Rectangle {
        implicitWidth: 24
        implicitHeight: 30
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.5) : Qt.rgba(0, 0, 0, 0.7)
    }

    contentItem: Text {
        text: parent.text
        font.family: segoe_mdl2.name
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        renderType: Text.NativeRendering
    }

}
