App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    const messagediv = this.renderMessage(data);
    // const notification = new Audio('http://onj3.andrelouis.com/phonetones/unzipped/Huawei/Huawei%20Ascend%20P6/notifications/Hand_Drum.ogg');
    // notification.play();
    return $('.message-box').prepend(messagediv);
  },

  renderMessage: function(data) {
    const userName = document.querySelector('#username').innerText;
    
    const messageDiv = document.createElement('div');
    
    if (userName === data.user) {
      messageDiv.classList.add('message-right');
    } else {
      messageDiv.classList.add('message-left');
    }
    
    const userNameP = document.createElement('p');
    userNameP.classList.add('user-name');
    userNameP.innerText = data.user;
    const textP = document.createElement('p');
    textP.innerText = data.message;

    messageDiv.append(userNameP);
    messageDiv.append(textP);

    return messageDiv;
  }
});