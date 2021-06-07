tourNames = tourNames.replace(/\[|\]/g, ' ');
dates = dates.replace(/\[|\]/g, ' ');

var tourNameArr = tourNames.split(",");
var tourDateArr = dates.split(",");

var coordinateArr = [];
var featureArr = [];

for (var i = 0; i < tourSize; i++) {
	coordinateArr.push(coordinateList.splice(0, 2));
	var tempGeo = {
		type: 'Feature',
		geometry: {
			type: 'Point',
			coordinates: coordinateArr[i]
		},
		properties: {
			title: 'Mapbox',
			description: tourNameArr[i]
		},
		info: {
			date: tourDateArr[i],
			star: stars[i] ? stars[i] + ' / 5' : '',
			place: tourNameArr[i]
		}
	}
	featureArr.push(tempGeo);
}

mapboxgl.accessToken = 'pk.eyJ1IjoieWxhbnR0IiwiYSI6ImNrcGdpbGdnejA3Y2sydmprMzk4d2gwM20ifQ.Wz5IizkQcBZ6FCBLz3wnEA';

var map = new mapboxgl.Map({
	container: 'map',
	style: 'mapbox://styles/mapbox/light-v10',
	center: [106, 10],
	zoom: 1
	// starting zoom
});

var geojson = {
	type: 'FeatureCollection',
	features: featureArr
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
					.setHTML('<p class="text-danger mb-0">' + marker.info.date + '</p><p class="text-success font-weight-bold mb-0">' + marker.info.star + '</p><p class="mb-0">' + marker.info.place + '</p>')).addTo(map);
	});