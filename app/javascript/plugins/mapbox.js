import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, coordinates) => {
  const bounds = new mapboxgl.LngLatBounds();
  coordinates.forEach((coordinate) => bounds.extend(coordinate));
  map.fitBounds(bounds, { padding: 80, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken =
      'pk.eyJ1IjoiZGlnaXRhbGtpbGwzcnIiLCJhIjoiY2s1d3Z0NGd2MXRybDNlbWx0bjFpdTJzMiJ9.NI5AijutKs6So5VFDX9URw';

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/digitalkill3rr/ckam4skh34gj11ilkdb67f47o',
      center: [37.61556, 55.75222],
      // zoom: 12,
    });

    // Add zoom and rotation controls to the map.
    map.addControl(new mapboxgl.NavigationControl());

    map.on('load', function() {
      map.addSource('dem', {
        type: 'raster-dem',
        url: 'mapbox://mapbox.terrain-rgb',
      });

      map.addLayer({
        id: 'hillshading',
        source: 'dem',
        type: 'hillshade',
      });

      const opts = {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' },
      };
      const routeId = mapElement.dataset.routeId;

      fetch(`/routes/${routeId}/map_data.json`, opts)
        .then((res) => res.json())
        .then((response) => {
          map.addSource('route', {
            type: 'geojson',
            data: {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'LineString',
                coordinates: JSON.parse(response.track),
              },
            },
          });

          map.addLayer({
            id: 'route',
            type: 'line',
            source: 'route',
            layout: {
              'line-join': 'round',
              'line-cap': 'round',
            },
            paint: {
              'line-color': '#EB5757',
              'line-opacity': 0.5,
              'line-width': 5,
            },
          });

          response.spots.forEach((item) => {
            const {
              geometry: { coordinates },
              properties: { name, status, image },
            } = item;

            let html = `<div class="spot-marker-popup">
              <div class="spot-marker-content">
                <div class="body16-bold">${name}</div>
                <div class="body14">${status}</div>
              </div>`;
            if (image) {
              html += `<div class="spot-marker-pic"><img src=${image}></div>`;
            }
            html += '</div>';
            var popup = new mapboxgl.Popup({ className: 'spot-popup' }).setHTML(html);

            const marker = new mapboxgl.Marker()
              .setLngLat(coordinates)
              .setPopup(popup)
              .addTo(map);
          });

          const track = JSON.parse(response.track);
          fitMapToMarkers(map, track);
        });
    });
  }
};

export { initMapbox };
