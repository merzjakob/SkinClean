const scrollToMapBottom = () => {
  if (document.getElementById('map')) {
    if (window.location.search === ""){
      document.getElementById('logo').scrollIntoView();
    } else {
      document.getElementById('map').scrollIntoView();
    }
  }
};

// new mapboxgl.Marker(el)
//   .setLngLat(marker.geometry.coordinates)
//   .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
//     .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>'))
//   .addTo(map);

export { scrollToMapBottom };

