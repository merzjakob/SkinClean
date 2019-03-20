const bannerArrowScroll = () => {
  if (document.querySelector(".banner")) {
    const stats = document.querySelector(".stats-container");
    $(".arrow").click(function(){
      stats.scrollIntoView({
            behavior: 'smooth'
        });
  });
  }
}

export { bannerArrowScroll };
