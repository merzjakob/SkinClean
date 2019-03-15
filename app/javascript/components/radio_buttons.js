const activeButtons = () => {
  if (document.querySelector('.chatBottom')) {
    $(document).ready(function(){
      document.querySelector(".chatBottom").scrollIntoView()
      $(".form-check").click(function(){
        $(".active").removeClass("active");
        $(this).toggleClass("active");
        this.querySelector("input").click();
      });
    });
  }
};

export { activeButtons };
