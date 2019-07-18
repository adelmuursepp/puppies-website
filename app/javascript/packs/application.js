import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initMapbox } from '../plugins/init_mapbox.js';
initUpdateNavbarOnScroll();
initMapbox();

