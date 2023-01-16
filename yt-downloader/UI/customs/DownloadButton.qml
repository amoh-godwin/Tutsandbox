import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Button {

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 24
        color: parent.down ? Qt.darker("#0078d4") : "#0078d4"
        radius: height / 2
    }

    contentItem: Text {
        text: parent.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }
}
