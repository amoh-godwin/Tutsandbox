import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"

                Rectangle {
                    id: viewerParent
                    anchors.fill: parent
                    color: "transparent"
                    clip: true

                    Image {
                        id: viewer
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        sourceSize.width: imgWidth
                        sourceSize.height: imgHeight
                        fillMode: Image.PreserveAspectFit
                        source: currImageSource
                    }

                }

                ControlBar {
                    anchors.top: parent.top
                }

                RowLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: 48

                    CustNavButton {
                        text: "\uf744"
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 18
                        onClicked: backend.get_image_at_index(currIndex - 1)
                        visible: currIndex > 0
                    }

                    CustNavButton {
                        text: "\uf746"
                        Layout.alignment: Qt.AlignRight
                        Layout.preferredWidth: 18
                        onClicked: backend.get_image_at_index(currIndex + 1)
                        visible: currIndex < imgTotal - 1
                    }

                }

                RowLayout {
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 12
                    width: 132
                    height: 30
                    spacing: 0

                    ZoomButton {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text: "\ue9a6"//"\uF617"
                    }
                    ZoomButton {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text: "\uf8ab"
                    }
                    ZoomButton {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        text: "\uf8aa"
                    }
                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

    }

}
