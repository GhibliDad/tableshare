import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages_box');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log(id);
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const current_user = messagesContainer.dataset.user
        const messageUser = data.user
        if(current_user == messageUser){
        messagesContainer.insertAdjacentHTML('beforeend', data.content);
        var element = document.getElementById("messages_box");
          element.scrollTop = element.scrollHeight;
        } else {
          messagesContainer.insertAdjacentHTML('beforeend', data.guest);
        var element = document.getElementById("messages_box");
          element.scrollTop = element.scrollHeight;
        }
      }
    });
  }
}

export { initChatroomCable };
