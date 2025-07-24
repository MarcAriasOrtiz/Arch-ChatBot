from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine

app = QApplication()

engine = QQmlApplicationEngine()


# Cargar interfaz QML
engine.load("Main.qml")

app.exec()
