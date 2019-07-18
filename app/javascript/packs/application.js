import "bootstrap";
import "jquery";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import { initMapbox } from '../plugins/init_mapbox.js';
initUpdateNavbarOnScroll();
initAutocomplete();
initMapbox();
