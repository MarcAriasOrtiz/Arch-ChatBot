#!/.venv/bin/python

# PyPi libs
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QUrl

# Standard libs
import sys
import json

# Project libs
from libs.get_clipboard import get_clipboard


def main():
    app = QApplication(sys.argv)

    engine = QQmlApplicationEngine()

    # Obtenermos el texto en caso de que hayamos hecho Ctrl + C
    initial_text = get_clipboard()
    print("Python: ", initial_text)    
    app_context = engine.rootContext()
    app_context.setContextProperty("initialText", initial_text)

    engine.load(QUrl("Main.qml"))

    app.exec()
    
if __name__ == "__main__":
    main()