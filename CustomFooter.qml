// FooterBar.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Rectangle {
  id: footer
  height: 60
  color: "#030303"
  Layout.fillWidth: true

  //anchors.left: parent.left
  //anchors.right: parent.right
  signal messageSent(string text)
  RowLayout {
    anchors.fill: parent
    anchors.margins: 8
    spacing: 8

    TextInput {
      id: inputField
      Layout.fillWidth: true
      Layout.alignment: Qt.AlignVCenter
      /*displayText: "Escribe tu mensaje..."*/
      font.pixelSize: 14
      color: "white"

      Keys.onReturnPressed: {
        if (inputField.text.trim() !== "") {
          footer.messageSent(inputField.text)
          inputField.text = ""
        }
      }
    }

    Button {
      id: sendButton
      text: "Enviar"
      enabled: inputField.text.trim().length > 0
      Layout.preferredWidth: 80
      onClicked: {
        footer.messageSent(inputField.text)
        inputField.text = ""
      }
    }
  }
}
