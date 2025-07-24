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

  property int currentTab: 0

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


    /*
    CustomTabBar {
      id: topBar
      Layout.fillWidth: true
      Layout.preferredHeight: 50
      currentTab: root.currentTab
      onCurrentTabChanged: root.currentTab = currentTab
    }
*/
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
    chatArea.loadMessages("Oni-Bot")
  }
}
