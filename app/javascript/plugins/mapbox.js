import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, features) => {
  const bounds = new mapboxgl.LngLatBounds();
  features.forEach(({ geometry }) => bounds.extend(geometry.coordinates));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
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
          'line-color': '#888',
          'line-width': 8,
        },
      });



      collection.features.forEach((item) => {
        var el = document.createElement('div');
        el.id = 'marker';

        // create the popup
        var popup = new mapboxgl.Popup({ offset: 25 }).setText();


        const marker = new mapboxgl.Marker(el).setLngLat(item.geometry.coordinates).setPopup(popup).addTo(map);
      });
      fitMapToMarkers(map, collection.features);
    });
  }
};

export { initMapbox };
