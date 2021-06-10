import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
    container: 'map',
    // center: [59.3653673, 17.9826506],
    style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const element = document.createElement('div');
      element.className = 'marker';
      element.id = 'event_' + marker.event_id;
      element.style.backgroundImage = "url('https://res.cloudinary.com/dkdk2tuol/image/upload/v1622726888/tableshare/logo_01_kd5ctr.png')";
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);
      new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map)
    });

   fitMapToMarkers(map, markers);
  }
};




export { initMapbox };
