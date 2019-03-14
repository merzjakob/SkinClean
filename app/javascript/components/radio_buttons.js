const activeButtons = () => {
  if (document.getElementsByClassName('form-check')) {
    $(document).ready(function(){
      document.querySelector(".speech-wrapper > .bubble:last-child").scrollIntoView()
      $(".form-check").click(function(){
        $(".active").removeClass("active");
        $(this).toggleClass("active");
        this.querySelector("input").click();
      });
    });
  }
};

export { activeButtons };
