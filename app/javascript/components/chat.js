const chatController = {
  refreshForm: function(innerHTML) {
    const newMessageForm = document.querySelector('.chatBottom');
    newMessageForm.innerHTML = innerHTML;
    this.attachEventListenersToNewButtons();
  },

  addMessage: function(messageHTML) {
    const messages = document.querySelector('.messages-list');
    messages.insertAdjacentHTML('beforeend', messageHTML);
    this.scrollToLastMessage();
  },


  scrollToLastMessage: function() {
    if (document.querySelector('.messages-list')) {
    $(document).ready(function(){
      const lastBubble = document.querySelector('.messages-list > li:last-child');
      if (lastBubble) {
        lastBubble.scrollIntoView()
      } else {
        document.querySelector(".chatBottom").scrollIntoView()
      }
      });
    };
},

  attachEventListenersToNewButtons: function() {
    $(".form-check").click(function(){
        $(".active").removeClass("active");
        $(this).toggleClass("active");
        this.querySelector("input").click();
      })
  }
}


export { chatController };
