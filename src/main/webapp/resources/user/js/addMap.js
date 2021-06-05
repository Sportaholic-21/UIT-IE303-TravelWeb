/**
 * 
 */
mapboxgl.accessToken = 'pk.eyJ1IjoieWxhbnR0IiwiYSI6ImNrcGdpbGdnejA3Y2sydmprMzk4d2gwM20ifQ.Wz5IizkQcBZ6FCBLz3wnEA';

var map = new mapboxgl.Map({
	container: 'map',
	style: 'mapbox://styles/mapbox/light-v10',
	center: [-96, 37.8],
	zoom: 1
	// starting zoom
});

var geojson = {
	type: 'FeatureCollection',
	features: [{
		type: 'Feature',
		geometry: {
			type: 'Point',
			coordinates: [-77.032, 38.913]
		},
		properties: {
			title: 'Mapbox',
			description: 'Washington, D.C.'
		}
	}, {
		type: 'Feature',
		geometry: {
			type: 'Point',
			coordinates: [-122.414, 37.776]
		},
		properties: {
			title: 'Mapbox',
			description: 'San Francisco, California'
		}
	}]
};

// add markers tomap
geojson.features
	.forEach(function(marker) {

		// create a HTML element for each feature
		var el = document.createElement('div');
		el.className = 'marker';

		// make a marker for each feature and add to the map
		new mapboxgl.Marker(el)
			.setLngLat(marker.geometry.coordinates)
			.setPopup(
				new mapboxgl.Popup({
					offset: 25
				})
					// add popups
					.setHTML('<p class="text-danger">12/12/2012</p><p>gooddd!!</p>'))
			.addTo(map);
	});

map.scrollWheelZoom.enable();