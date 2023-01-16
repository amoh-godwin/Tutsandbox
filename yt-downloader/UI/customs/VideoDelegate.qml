import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"

                Image {
                    anchors.fill: parent
                    source: thumbnail
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    text: title
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    height: parent.height
                    width: parent.width
                    color: Qt.rgba(0,0,0,0.7)
                }
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 2

                    Cust.ComboBox {
                        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                        model: ['720p', '1080p']
                    }

                    Cust.DownloadButton {
                        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                        text: file_path ? 'Open File' : "Download"

                        onClicked:{
                            if (this.text == 'Download') {
                                percent = 0.002; downloader.download(index, link)
                            } else {
                                percent = 0
                                downloader.open_file(index, file_path)
                            }
                        }
                    }

                }

            }

        }

        Rectangle {
            anchors.fill: parent
            color: "#44ffffff"
            visible: percent > 0.001

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - 100
                height: 12
                radius: 6
                color: "#24000000"

                Rectangle {
                    width: parent.width / 100 * percent
                    height: parent.height
                    radius: parent.radius
                    color: "#0078d4"
                    opacity: 0.8
                }

                Text {
                    anchors.centerIn: parent
                    text: percent + "%"
                    color: percent > 50 ? "white" : "dimgrey"
                }
            }
        }

    }
}