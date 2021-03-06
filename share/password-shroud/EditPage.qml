import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
  id: editPage
  title: i18n.tr("open password-shroud")
  visible: false
  onActiveChanged: {
    passwdField.text = ""
  }
  
  Column { 
    spacing: units.gu(2)
    width: parent.width
    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
      margins: units.gu(2)
    }
    Label {
      id: ngLabel
      objectName: "label"
      text: i18n.tr("provide a masterpassword...")
    }
    TextField {
      id: passwdField
      width: parent.width
      cursorVisible: true
      echoMode: TextInput.PasswordEchoOnEdit
      hasClearButton: true
    }
    Button {
      id: passBtn
      text: i18n.tr("Decrypt password-shroud")
      color: UbuntuColors.green
      anchors.horizontalCenter: parent.horizontalCenter
      
      onClicked: {
        var ret = ctrl.openshroud(passwdField.text) 
        if (ret == true) {
          decryptResponse.text = ""
          populate()
          myPages.push(listPage)
        } else {
          decryptResponse.text = i18n.tr("Wrong password supplied?")
        }
      }
    }

    Label {
      id: decryptResponse
      color: UbuntuColors.purple
      text: ""
    }
    Label {
      color: UbuntuColors.orange
      text: i18n.tr("This is an early version!")
    }
  }

  function populate() {
    if (newListModel.count > 0){
      newListModel.clear()
    }
    console.log("init model")
    for (var i = 0; i < ctrl.items.len; i++){
      newListModel.insert(i,{"name":ctrl.items.get(i).name, "url":ctrl.items.get(i).url})
    }
  }
}
