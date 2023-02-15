import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts
import "./components" as Comp

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 802
    height: 635
    flags: Qt.FramelessWindowHint | Qt.Window

    property string title_str: "Photos"
    property bool portrait: width < 803

    property int orig_x: 0
    property int orig_y: 0

    property QtObject backend

    property string currImageSource: ""
    property int currIndex: -1
    property int imgWidth: 0
    property int imgHeight
    property int imgTotal

    title: "Photos"

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_font; source: "./components/Segoe UI.ttf" }
    FontLoader {id: segoe_bold; source: "./components/Segoe UI Bold.ttf" }
    FontLoader {id: segoe_icon; source: "./components/Segoe Fluent Icons.ttf" }
    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        width: parent.width - 2
        height: 30
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                orig_x = mouseX
                orig_y = mouseY
            }

            onPositionChanged: {
                if(!containsPress) {
                    return;
                }
                var dx = mouse.x - orig_x
                var dy = mouse.y - orig_y
                var newx = mainWindow.x + dx
                var newy = mainWindow.y + dy
                mainWindow.setX(newx);
                mainWindow.setY(newy);
            }

            onReleased: {
                orig_x = mouseX
                orig_y = mouseY
            }

        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 12
            spacing: 0

            Text {
                text: title_str
                font.family: segoe_bold.name
                font.pixelSize: 12
                font.bold: true
                color: "white"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
            }

            Comp.CloseButton {
                text: "\ue921"
                onClicked: mainWindow.showMinimized()
            }

            Comp.CloseButton {
                text: portrait ? "\ue922" : "\uE923"
                onClicked: portrait ? mainWindow.showMaximized() : mainWindow.showNormal()
            }

            Comp.CloseButton {
                text: "\ue8bb"
                onClicked: mainWindow.close()
            }

        }


    }


    StackView {
        id: mainStack
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height -2
        //anchors.bottom: parent.bottom
        initialItem: individual
    }

    Comp.CollectionsView {id: collections }
    Comp.IndividualView {id: individual }


    Popup {
        anchors.centerIn: parent
        width: 300
        height: 200
        modal: true
        dim: true
        visible: false
    }

    background: Rectangle {
        width: parent.width
        height: parent.height
        border.width: portrait ? 1 : 0
        border.color: "gold"
        color: "transparent"
    }


    Connections {
        target: backend

        function onFirstImage(title, img, index, w, h, total) {
            title_str = title + " - Photos"
            currImageSource = img
            currIndex = index
            imgWidth = w
            imgHeight = h
            imgTotal = total
        }

        function onUpdateImage(title, img, index, w, h) {
            title_str = title + " - Photos"
            currImageSource = img
            currIndex = index
            imgWidth = w
            imgHeight = h
        }
    }

}
