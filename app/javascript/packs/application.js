import "bootstrap";
import { activeButtons } from '../components/radio_buttons';
import { showDropdown } from '../components/dropdown';
import { chatController } from '../components/chat';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { scrollToMapBottom } from '../components/map';
import { bannerArrowScroll } from '../components/banner_arrow';
import { initSweetalert } from '../plugins/init_sweetalert';

activeButtons();
initMapbox();
showDropdown();
scrollToMapBottom();
bannerArrowScroll();
global.chatController = chatController;
initSweetalert('#sweet-alert-demo', {
  title: "Still pending",
  text: "The doctor has not yet submitted the diagnosis. This takes on average 4 hours.",
  icon: "warning"
});
