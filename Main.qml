import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "."

ApplicationWindow {
  id: root
  height: 600
  width: 400
  visible: true
  color: "#000000"

  // property int currentTab: 0 // por si pones tab bar arriba con varias opciones

  // property string initialText: ""

  ColumnLayout {
    anchors.fill: parent

    CustomTitle {
      id: title
      Layout.fillWidth: true

      onMessagesCleared: {
        //console.log("Mensaje borrado, recargando lista...")
        chatArea.loadMessages("Oni-Bot")
      }
    }

    CustomTextArea {
      id: chatArea
      Layout.fillWidth: true
      Layout.fillHeight: true
    }

    CustomFooter {
      id: footer
      Layout.fillWidth: true

      onMessageSent: text => {
                       chatArea.addMessage("Mao", text)
                       chatArea.showTypingBubble()
                       chatArea.sendMessageBackend(text)
                     }
    }
  }
  Component.onCompleted: {
    console.log(initialText)

    if (typeof initialText !== "string") {
        console.log("❌ initialText no es string:", initialText, typeof initialText)
    } else if (initialText.length === 0) {
        console.log("⚠️ initialText está vacío")
    } else {
        console.log("✅ Texto recibido:", initialText)
    }
    
    chatArea.loadMessages("Oni-Bot")


    if (initialText && initialText.length > 0) {
      chatArea.addMessage("Mao", initialText)
      chatArea.showTypingBubble()
      chatArea.sendMessageBackend(initialText)
    }
  }
}
