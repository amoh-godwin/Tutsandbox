import sys

from PyQt6.QtQuick import QQuickWindow
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

from downloader import Downloader


# QQuickWindow.setSceneGraphBackend("software")

app = QGuiApplication(sys.argv)

down = Downloader()

engine = QQmlApplicationEngine()
engine.load('./UI/main.qml')
engine.rootObjects()[0].setProperty('downloader', down)
engine.quit.connect(app.quit)

sys.exit(app.exec())
