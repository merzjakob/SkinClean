const scrollToMapBottom = () => {
  if (document.getElementById('map')) {
    if (window.location.search === ""){
      document.getElementById('logo').scrollIntoView();
    } else {
      document.getElementById('map').scrollIntoView();
    }
  }
};
export { scrollToMapBottom };
