import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 600

    /*property var imgs: [
        "pexels-araz-yurtseven-12531788.jpg", 'pexels-pixabay-358457.jpg',
        'pexels-pixabay-36762.jpg', 'pexels-pixabay-33109.jpg',
        'pexels-paul-ijsendoorn-33041.jpg', 'pexels-frederico-erthal-3571576.jpg',
        'pexels-ruvim-miksanskiy-1438761.jpg']
    property var m_imgs: []*/


    ScrollView {
        id: sv

        property var imgs: [
            "pexels-araz-yurtseven-12531788.jpg", 'pexels-pixabay-358457.jpg',
            'pexels-pixabay-36762.jpg', 'pexels-pixabay-33109.jpg',
            'pexels-paul-ijsendoorn-33041.jpg', 'pexels-frederico-erthal-3571576.jpg',
            'pexels-ruvim-miksanskiy-1438761.jpg']
        property var m_imgs: []

        width: 800
        height: 600
        anchors.leftMargin: 70
        anchors.rightMargin: 12
        GridView {
            width: parent.width
            height: parent.height
            //anchors.right: parent.right
            model: 2
            cellWidth: width
            cellHeight: 210
            delegate: Rectangle {
                RowLayout {
                width: 800
                Image {
                    width: 200
                    Layout.fillHeight: true
                    //Layout.columnSpan: 2
                    source: "./test_images/"+sv.imgs[0]
                }
                Image {
                    width: 200
                    Layout.fillHeight: true
                    //Layout.columnSpan: 2
                    source: "./test_images/"+sv.imgs[1]

                }

                Image {
                    width: 200
                    Layout.fillHeight: true
                    //Layout.columnSpan: 2
                    source: "./test_images/"+sv.imgs[2]

                }

                Image {
                    width: 200
                    Layout.fillHeight: true
                    //Layout.columnSpan: 2
                    source: "./test_images/"+sv.imgs[3]

                }
                }


            }

        }
    }

}
