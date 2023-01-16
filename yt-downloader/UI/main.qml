import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            margins: 1
        }
        width: parent.width
        height: 78
        color: "transparent"

        
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }
                        
                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

        Rectangle {
            width: parent.width
            height: 1
            anchors.top: parent.top
            color: "#44000000"
        }


    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 1

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  ListModel {}
                spacing: 12
                delegate: Cust.VideoDelegate {}
            }

        }

    }

    background: Rectangle {
        color: "#44000000"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1
        }

    }

    Connections {
        target: downloader

        function onDownloaded(ind, filepath) {
            lv.model.get(ind).percent = 0;
            lv.model.get(ind).file_path = filepath
        }

        function onProgressChanged(ind, per) {
            lv.model.get(ind).percent = per;
        }

        function onReturnVideoInfo(video_info) {
            console.log(video_info[0].thumbnail)
            lv.model.append(video_info[0])
        }
    }

}
