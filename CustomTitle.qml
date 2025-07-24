import QtQuick
import QtQuick.Layouts

Rectangle {
  id: titleRectangle
  Layout.fillWidth: true
  height: 30 
  color: "#030303"
  //color: "rgba(3, 3, 3, 0)"
  radius: 0
  border.color: "#000000"
  border.width: 1

  signal messagesCleared(string chatId)  // nuevo signal

  function clearMessagesBackend(chatId) {
    var xhr = new XMLHttpRequest()
    xhr.open("DELETE", "http://localhost:7894/llm_db/delete_messages/" + chatId)
    xhr.setRequestHeader("Accept", "application/json")
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          console.log("Mensajes eliminados...")
          // Emitimos el signal para avisar que ya se borraron
          titleRectangle.messagesCleared(chatId)
        } else {
          console.log("Error al eliminar mensajes...")
        }
      }
    }
    xhr.send()
  }

  Text {
    id: clearChat
    text: "/clear"
    color:  "white"
    font.bold: true
    font.pointSize: 16
    font.family: "Arial"
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 10

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

      onClicked: {
        titleRectangle.clearMessagesBackend("Oni-Bot")
      }
    }
  }
}
