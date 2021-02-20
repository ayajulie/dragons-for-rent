import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import places from 'places.js';


const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    // style: 'mapbox://styles/mapbox/streets-v11'
    style: 'mapbox://styles/ayajulie/cklb5rxl32ki617mq17eenmwn'
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.width = '25px';
    element.style.height = '25px';
    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  })
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));

  }
};

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');

//   if (mapElement) {
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v11'
//     });

//     map.on('load', function () {
//       const markers = JSON.parse(mapElement.dataset.markers);
//       map.addSource('markers', {
//         type: 'geojson',
//         data: markers,
//         cluster: true,
//         clusterMaxZoom: 14,
//         clusterRadius: 50
//       });

//       map.addLayer({
//         id: 'clusters',
//         type: 'circle',
//         source: 'markers',
//         filter: ['has', 'point_count'],
//         paint: {
//           'circle-color': [
//             'step',
//             ['get', 'point_count'],
//             '#51bbd6',
//             100,
//             '#f1f075',
//             750,
//             '#f28cb1'
//           ],
//           'circle-radius': [
//             'step',
//             ['get', 'point_count'],
//             20,
//             100,
//             30,
//             750,
//             40
//           ]
//         }
//       });

//       map.addLayer({
//         id: 'cluster-count',
//         type: 'symbol',
//         source: 'markers',
//         filter: ['has', 'point_count'],
//         layout: {
//           'text-field': '{point_count_abbreviated}',
//           'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
//           'text-size': 12
//         }
//       });

//       map.addLayer({
//         id: 'unclustered-point',
//         type: 'circle',
//         source: 'markers',
//         filter: ['!', ['has', 'point_count']],
//         paint: {
//           'circle-color': '#11b4da',
//           'circle-radius': 10,
//           'circle-stroke-width': 1,
//           'circle-stroke-color': '#fff'
//         }
//       });

//       map.on('click', 'clusters', function (e) {
//         const features = map.queryRenderedFeatures(e.point, { layers: ['clusters'] });
//         const clusterId = features[0].properties.cluster_id;

//         map.getSource('markers').getClusterExpansionZoom(clusterId, function (err, zoom) {
//           if (err) return;

//           map.easeTo({
//             center: features[0].geometry.coordinates,
//             zoom: zoom
//           });
//         });
//       });

//       map.on('mouseenter', 'clusters', function (e) {
//         map.getCanvas().style.cursor = 'pointer';
//       });

//       map.on('mouseleave', 'clusters', function () {
//         map.getCanvas().style.cursor = '';
//       });

//       map.on('click', 'unclustered-point', function (e) {
//         const features = map.queryRenderedFeatures(e.point, { layers: ['unclustered-point'] });
//         const infoWindow = features[0].properties.info_window;
//         const coordinates = features[0].geometry.coordinates;

//         map.easeTo({
//           center: features[0].geometry.coordinates
//         });

//         new mapboxgl.Popup()
//           .setLngLat(coordinates)
//           .setHTML(infoWindow)
//           .addTo(map);
//       });

//       map.on('mouseenter', 'unclustered-point', function () {
//         map.getCanvas().style.cursor = 'pointer';
//       });

//       map.on('mouseleave', 'unclustered-point', function () {
//         map.getCanvas().style.cursor = '';
//       });

//       fitMapToMarkers(map, markers.features);
//     });
//   }
// };

export { initMapbox };
