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

  addNextQuestion: function(questionHTML, isPhoto) {
    this.addMessage(questionHTML);
    if (isPhoto == "true") {
      this.initiateCamera();
    }
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

  initiateCamera: function() {
    // Grab elements, create settings, etc.
    var video = document.getElementById('video');
            // location.reload();
            // Get access to the camera!
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
               // Not adding `{ audio: true }` since we only want video now
      navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
        //video.src = window.URL.createObjectURL(stream);
        video.srcObject = stream;
        video.play();
      });
    }
    var canvas = document.getElementById('canvas');
    var context = canvas.getContext('2d');
    var video = document.getElementById('video');
    const formInput = document.getElementById("patient_answer_photo")

    // Trigger photo take
    document.getElementById('snap').addEventListener('click', function(event) {
    context.drawImage(video, 0, 0, 120, 240);
    const encoded = canvas.toDataURL();
    // const decoded = atob(encoded.split(",")[1]);
    formInput.value = encoded;
      event.preventDefault();
    });
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


