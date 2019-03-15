const activeButtons = () => {
  if (document.getElementsByClassName('form-check')) {
    $(document).ready(function(){
      $(".form-check").click(function(){
        $(".active").removeClass("active");
        $(this).toggleClass("active");
      });
    });
  }
};

export { activeButtons };
