const showDropdown = () => {
  $(function() {
    $('.accordian li').on('click', function() {
      if ($(this).find('ul').hasClass('open')) {
        $('ul.open').slideToggle().removeClass('open');
        $('.accordian h3 span').removeClass('closed');
        $('.accordian h3').removeClass('closed');
      } else {
        $('ul.open').slideToggle().removeClass('open');
        $(this).find('ul').slideToggle().addClass('open');
        $('.accordian h3, .accordian h3 span').removeClass('closed');
        $(this).find('h3, h3 span').addClass('closed')
      }
    });
    // Active class adds open class
    $('.accordian li.active ul').slideDown().addClass('open');
  });
};

export {showDropdown};




  // if (document.querySelector(".medicine-card-visible")) {
  //   const dropdown = document.querySelectorAll(".medicine-card-visible").forEach((medicine) => {
  //   medicine.addEventListener("click", (event) => {
  //     event.currentTarget.classList.toggle("medicine-card-invisible");
  //     event.currentTarget.classList.toggle("medicine-card-visible");
  //   });
  // });
  // }
