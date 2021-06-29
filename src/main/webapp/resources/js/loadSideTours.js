var tourList = [];

var sidebarTourhtml = (tourId, tourName, nationName, price, imageURL) => {
    var data = {
        tourId: tourId,
        tourName: tourName,
        nationName: nationName,
        price: price,
        imageURL: imageURL
    }
    var template = [
        '<div class="d-flex position-relative mt-3 ms-4 me-4 justify-content-center">',
        '<div class="sidebar__thumbnail mt-2">',
        '<img src="{{imageURL}}" class="img-thumbnail" alt="Package thumbnail">',
        '</div>',
        '<a class="d-block ms-4 text-decoration-none" href="/UIT-IE303-TravelWeb/tour-detail/{{tourId}}">',
        '<p class="fs-4 m-0">{{tourName}}</p>',
        '<p class="fs-6 fw-light"><span class="sidebar__location-icon d-inline-block me-1">',
        '<img src="/UIT-IE303-TravelWeb/resources/images/sidebar-location-icon.png" class="img-fluid" alt="Location icon">',
        '</span><span>{{nationName}}</span></p>',
        '<p class="lh-lg mt-3 bg-warning rounded-pill ps-4 pe-4 text-white sidebar__package-price">FROM	{{price}} $</p>',
        '</a>',
        '</div>'
    ].join("\n");
    var html = Mustache.render(template, data);
    return html;
}

var loadSideTours = (arr, tagID) => {
    let html
    arr.forEach(tour => {
        html = sidebarTourhtml(tour.tourId, tour.tourName, tour.nationName, tour.price, tour.imageURL)
        $(tagID).append(html)
    })
}

var getSideTours = async () => {
    await axios.get("/UIT-IE303-TravelWeb/api/sidebarTourList").then((res) => {
        tourList = res.data
    })
}

$(document).ready(async () => {
    await getSideTours();
    loadSideTours(tourList,"#sidebar");
    if ($("#best-packages-content").length) loadSideTours(tourList,"#best-packages-content")
})