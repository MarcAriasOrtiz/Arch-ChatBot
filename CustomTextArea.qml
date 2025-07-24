// CustomTextArea.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ScrollView {
  id: chatArea
  Layout.fillWidth: true
  Layout.fillHeight: true
  clip: true

  // Fondo animado
  AnimatedImage {
    source: "hacker_oni_watermark.gif"
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    playing: true
    opacity: 0.1
    z: -1
  }

  ListView {
    id: messageList
    width: chatArea.width
    anchors.fill: parent
    model: messageModel
    spacing: 12
    clip: true

    delegate: CustomChatBubble {
      sender: model.sender
      message: model.message
      typing: model.typing
    }

    // Scroll automático al añadir mensajes
    onCountChanged: Qt.callLater(positionViewAtEnd)
  }

  ListModel {
    id: messageModel
  }

  // Añade un mensaje al chat
  function addMessage(sender, text) {
    messageModel.append({
                          "sender": sender,
                          "message": text,
                          "typing": false
                        })
  }

  // Carga mensajes desde el backend
  function loadMessages(chatId) {
    //console.log("Loading memory")
    messageModel.clear()
    var xhr = new XMLHttpRequest()
    xhr.open("GET", "http://localhost:7894/llm_db/get_messages/" + chatId)
    xhr.setRequestHeader("Accept", "application/json")
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          var mensajes = JSON.parse(xhr.responseText)
          for (var i = 0; i < mensajes.length; i++) {
            //console.log(mensajes[i].type)
            //console.log(mensajes[i].content)
            addMessage(mensajes[i].type, mensajes[i].content)
          }
        } else {
          //console.error("Error al cargar mensajes antiguos:", xhr.status,
          //              xhr.responseText)
        }
      }
    }
    xhr.send()
  }

  // Añade mensajes Backend
  function sendMessageBackend(text) {
    var xhr = new XMLHttpRequest()
    xhr.open("POST", "http://localhost:7894/send_message/send")
    xhr.setRequestHeader("Accept", "application/json")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // Suponiendo que la respuesta es un JSON con el texto de la IA
          var respuesta = JSON.parse(xhr.responseText)
          // console.log(respuesta.toString())
          // Ajusta el acceso según el formato de la respuesta
          //console.log("Eliminar TypingBubble")
          removeTypingBubble()
          //console.log("Oni-bot")
          //console.log(respuesta.toString())
          addMessage("Oni-Bot", respuesta.toString())
        } else {
          addMessage("Oni-Bot",
                     "⚠️ Error al contactar con el backend: " + xhr.status)
        }
      }
    }
    var body = {
      "model"/*: "tngtech/deepseek-r1t2-chimera:free",*/ /*: "meta-llama/llama-4-maverick:free",*/:"deepseek/deepseek-r1-0528-qwen3-8b:free",
      "text":text    }
    xhr.send(JSON.stringify(body))
  }

  // Añadir burbuja typing
  function showTypingBubble() {
    //console.log("Añadir typingBubble")
    messageModel.append({
                          "sender": "Oni-Bot",
                          "message": "typing",
                          "typing": true
                        })
  }

  // Eliminar burbuja typing
  function removeTypingBubble() {
    for (var i = messageModel.count - 1; i >= 0; i--) {
      if (messageModel.get(i).typing) {
        messageModel.remove(i)
        break
      }
    }
  }
}
