import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

ToolButton {
    id: ctrl

    property string description: "Edit"
    property string tip: ""

    Layout.fillHeight: true

    //font.family:
    //font.pixelSize: 20

    contentItem: ColumnLayout {
        width: parent.wdith
        height: parent.height
        spacing: 0
        Text {
            topPadding: 8
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            text: ctrl.text
            font.family: segoe_mdl2.name
            font.pixelSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            //verticalAlignment: Text.AlignVCenter
        }

        Text {
            Layout.topMargin: -12
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: description
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            visible: ctrl.height > 48
        }
    }


    ToolTip {
        z: 10
        y: 0
        parent: parent
        visible: parent.hovered
        text: parent.tip
        delay: 1000
    }

}
