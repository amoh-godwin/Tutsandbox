import QtQuick
import QtQuick.Controls.Basic

Button {
    id: btn
    width: 10
    height: 10

    property color bg_color: "darkgrey"

    background: Rectangle {
        radius: 5
        color: btn.bg_color
    }

}
