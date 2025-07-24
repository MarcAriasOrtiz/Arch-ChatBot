// CustomChatBubble.qml
import QtQuick 2.15
import QtQuick.Window 2.15  // Para Clipboard
import QtQuick.Controls 2.15

Item {
  id: chatBubble
  property string sender: ""
  property string message: ""
  property bool typing: false

  width: parent ? parent.width : 360
  implicitHeight: bubbleColumn.implicitHeight + 8

  Column {
    id: bubbleColumn
    width: parent.width
    spacing: 8
    anchors.margins: 8

    // Remitente (siempre arriba)
    Label {
      text: sender
      color: "#aaa"
      font.bold: true
      font.pixelSize: 12
    }

    // Burbuja de mensaje
    Rectangle {
      width: parent.width
      color: sender === "Mao" ? "#1122aa22" : "#11444444"
      radius: 8
      implicitHeight: typing ? 40 : messageText.implicitHeight + 24

      // Si typing, muestra los puntos animados
      Row {
        anchors.centerIn: parent
        spacing: 4
        visible: typing

        Text {
          id: dots
          text: ""
          color: "white"
          font.pixelSize: 18

          property string dotStr: ""
          Timer {
            interval: 400
            running: typing
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

      // Si no typing, muestra el mensaje normal
      TextArea {
        id: messageText
        text: message
        wrapMode: Text.Wrap
        width: parent.width - 24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 12
        color: "white"
        font.pixelSize: 14
        visible: !typing

        // Nuevas propiedades para selección de texto
        readOnly: true
        selectByMouse: true
            }
    }
  }
}
