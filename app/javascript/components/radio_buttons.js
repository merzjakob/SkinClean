const activeButtons = () => {
  if (document.querySelector('.chatBottom')) {
    $(document).ready(function(){
      const lastBubble = document.querySelector(".chatMessages > .speech-wrapper > div:last-child");

      if (lastBubble) {
        lastBubble.scrollIntoView()
      } else {
        document.querySelector(".chatBottom").scrollIntoView()
      }


      $(".form-check").click(function(){
        $(".active").removeClass("active");
        $(this).toggleClass("active");
        this.querySelector("input").click();
      });
    });
  }
};

export { activeButtons };
