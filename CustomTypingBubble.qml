// CustomTypingBubble.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
  color: "#11444444"
  radius: 8
  width: parent.width
  height: 40

  Row {
    anchors.centerIn: parent
    spacing: 4

    Text {
      text: "Oni-Bot"
      color: "#aaa"
      font.pixelSize: 12
    }
    Text {
      id: dots
      text: ""
      color: "white"
      font.pixelSize: 18

      property string dotStr: ""
      Timer {
        interval: 400
        running: true
        repeat: true
        onTriggered: {
          if (dots.dotStr.length >= 3) {
            dots.dotStr = ""
          } else {
            dots.dotStr += "."
          }
          dots.text = dots.dotStr
        }
      }
    }
  }
}
