import "bootstrap";
import { activeButtons } from '../components/radio_buttons';
import { showDropdown } from '../components/dropdown';
import { chatController } from '../components/chat';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { scrollToMapBottom } from '../components/map';

activeButtons();
initMapbox();
showDropdown();
scrollToMapBottom();
global.chatController = chatController;

