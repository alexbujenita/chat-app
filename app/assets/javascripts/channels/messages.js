App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    // $("#message-box").removeClass('hidden')
    console.log("RETURN OF RENDERMESSAGE", this.renderMessage(data))
    let messagediv = this.renderMessage(data)
    console.log(messagediv)
    return $('.message-box').prepend(messagediv);
  },

  renderMessage: function(data) {
    const userName = document.querySelector('#username').innerText;

    console.log(userName, data);
    
    const messageDiv = document.createElement('div');
    
    if (userName === data.user) {
      messageDiv.classList.add('message-right');
    } else {
      console.log("USERNAME", userName)
      console.log("DATAUSER", data.user)

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