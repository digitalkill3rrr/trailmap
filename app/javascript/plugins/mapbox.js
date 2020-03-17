import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, features) => {
  const bounds = new mapboxgl.LngLatBounds();
  features.forEach(({ geometry }) => bounds.extend(geometry.coordinates));
  map.fitBounds(bounds, { padding: 80, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken =
      'pk.eyJ1IjoiZGlnaXRhbGtpbGwzcnIiLCJhIjoiY2s1d3Z0NGd2MXRybDNlbWx0bjFpdTJzMiJ9.NI5AijutKs6So5VFDX9URw';

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/digitalkill3rr/ck3x6ftex0v0g1cmq2b5ps6kz',
      center: [37.6155600, 55.7522200],
      // zoom: 12,
    });

    // Add zoom and rotation controls to the map.
    map.addControl(new mapboxgl.NavigationControl());

    map.on('load', function() {
      const collection = JSON.parse(mapElement.dataset.collection);
      const coordinates = collection.features.map((item) => item.geometry.coordinates);

      map.addSource('route', {
        type: 'geojson',
        data: {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: coordinates,
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

      map.addSource('dem', {
          'type': 'raster-dem',
          'url': 'mapbox://mapbox.terrain-rgb'
      });

      map.addLayer(
        {
          'id': 'hillshading',
          'source': 'dem',
          'type': 'hillshade'
        }
      );



      collection.features.forEach((item) => {
        const {
          geometry: { coordinates },
          properties: { name, status, author, image },
        } = item;

        const html = `<div class="spot-block__wrapper"><div class="spot-info-container"><div id="label-s--bold">${status}</div><div id="body-l">${name}</div><div id="body-m--bold">${author}</div></div><div class="spot-image--small"><img src=${image}></div></div>`;
        var popup = new mapboxgl.Popup({ className: "spot-popup" }).setHTML(html);


        const marker = new mapboxgl.Marker()
          .setLngLat(coordinates)
          .setPopup(popup)
          .addTo(map);
      });

      fitMapToMarkers(map, collection.features);
    });
  }
};

export { initMapbox };
