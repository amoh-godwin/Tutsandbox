import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtQuick import QQuickWindow

from func import Backend


QQuickWindow.setSceneGraphBackend('software')

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
back_end = Backend()
engine.load('./UI/main.qml')
engine.rootObjects()[0].setProperty('backend', back_end)
back_end.start_up(sys.argv)
engine.quit.connect(app.quit)

sys.exit(app.exec())
