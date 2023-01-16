import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

/*ApplicationWindow {
    visible: true
    width: 800
    height: 600
    Universal.theme: Universal.Dark*/

    ToolBar {
        id: toolbar
        width: parent.width
        height: 48

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"

                ToolButton {
                    id: ctrl
                    text: "View all photos"
                    width: 148
                    height: 48

                    contentItem: RowLayout {
                        anchors.left:parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        Text {
                            text: "\uEB9F"
                            font.family: segoe_mdl2.name
                            font.pixelSize: 16
                            color: "white"
                            renderType: Text.NativeRendering

                        }

                        Text {
                            text: ctrl.text
                            color: "white"
                            font.family: segoe_font.name
                            font.pixelSize: 16
                        }
                    }
                }

            }

            CustToolButton {
                text: "\ue72d"
                tip: ""
            }

            CustToolButton {
                text: "\ue786"
                tip: ""
            }

            CustToolButton {
                text: "\ue70f"
                tip: ""
            }
            CustToolButton {
                text: "\ue7ad"
                tip: ""
            }
            CustToolButton {
                text: "\ue74d"
                tip: ""
            }

            MenuBar {
                font.pixelSize: 20
                font.family: segoe_mdl2.name
                Layout.preferredWidth: 46
                Layout.fillHeight: true

                delegate: MenuBarItem {
                    width: 46
                    height: 48

                    background: Rectangle {
                        color: parent.hovered ? "#90202020": "transparent"
                    }
                }

                Menu {
                    title: "\ue712"
                    font.family: segoe_mdl2.name
                    //font.pixelSize: 20

                    onAboutToShow: {
                        toolbar.height = 64
                    }
                    onAboutToHide: {
                        toolbar.height = 48
                    }

                    Action{
                        text: "Open with"
                    }
                    Action {
                        text: "Copy"
                    }
                    Action {
                        text: "Print"
                    }
                    Action {
                        text: "Set as"
                    }
                    MenuSeparator {}
                    Action {
                        text: "File info"
                    }
                }


            }


        }

        background: Rectangle {
            color: "#90202020"
        }
    }

//}
