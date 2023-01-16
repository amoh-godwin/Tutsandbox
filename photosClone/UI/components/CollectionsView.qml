import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Component {

    Rectangle {
        id: comp
        anchors.fill: parent
        color: "transparent"

        property int default_drawer_width: 48
        property int expanded_drawer_width: 250
        property int drawer_width: portrait ? 48 : 250

        ColumnLayout {
            anchors.right: parent.right
            width: portrait ? parent.width - 48 : parent.width - drawer.width
            height: parent.width
            spacing: 0

            ControlBar {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"
            }

        }

        Drawer {
            id: drawer
            width: drawer_width
            height: parent.height
            visible: true
            modal: false
            interactive: false

            Button {
                text: "rev"
                onClicked: {
                    drawer.width = drawer.width > 48 ? 48 : comp.expanded_drawer_width
                }
            }

            background: Rectangle {
                color: "black"
            }

        }



    }

}
