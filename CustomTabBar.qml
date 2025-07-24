// CustomTabBar.qml
import QtQuick
import QtQuick.Controls

TabBar {
  id: bar
  property int currentTab: 0

  height: 50
  currentIndex: currentTab
  onCurrentIndexChanged: currentTab = currentIndex

  background: Rectangle {
    color: "#383434"
  }

  TabButton {
    id: llamaButton
    text: qsTr("llama")
    contentItem: Text {
      text: llamaButton.text
      opacity: enabled ? 1.0 : 0.5
      color: llamaButton.down ? "red" : "darkgrey"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
      font.bold: bar.currentIndex === 0
    }
    background: Rectangle {
      color: bar.currentIndex === 0 ? "black" : "#383434"
      Rectangle {
        anchors.right: parent.right
        width: 1
        color: "darkgrey"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
      }
      Rectangle {
        anchors.bottom: parent.bottom
        height: 1
        color: "darkgrey"
        anchors.left: parent.left
        anchors.right: parent.right
      }
    }
    onClicked: currentTab = 0
  }

  TabButton {
    id: deepButton
    text: qsTr("deep-seek-r1")
    contentItem: Text {
      text: deepButton.text
      opacity: enabled ? 1.0 : 0.5
      color: deepButton.down ? "red" : "darkgrey"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
      font.bold: bar.currentIndex === 1
    }
    background: Rectangle {
      color: bar.currentIndex === 1 ? "black" : "#383434"
      Rectangle {
        anchors.left: parent.left
        width: 1
        color: "darkgrey"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
      }
      Rectangle {
        anchors.bottom: parent.bottom
        height: 1
        color: "darkgrey"
        anchors.left: parent.left
        anchors.right: parent.right
      }
    }
    onClicked: currentTab = 1
  }

  TabButton {
    id: gwenButton
    text: qsTr("gwen")
    contentItem: Text {
      text: gwenButton.text
      opacity: enabled ? 1.0 : 0.5
      color: gwenButton.down ? "red" : "darkgrey"
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
      font.bold: bar.currentIndex === 2
    }
    background: Rectangle {
      color: bar.currentIndex === 2 ? "black" : "#383434"
      Rectangle {
        anchors.left: parent.left
        width: 1
        color: "darkgrey"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
      }
      Rectangle {
        anchors.bottom: parent.bottom
        height: 1
        color: "darkgrey"
        anchors.left: parent.left
        anchors.right: parent.right
      }
    }
    onClicked: currentTab = 2
  }
}
