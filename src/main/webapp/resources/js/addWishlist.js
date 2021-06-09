/**
 * 
 */
$(document).on("click", ".addWishlist", function() {
	var id = $(this).data("id");
	var link = $(this).data("link");

	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: link,
		data: {
			id: id
		},
		dataType: 'json',
		success: function(data) {
			$("#wishListNum").text(data);
		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});
});

$(document).on("click", ".removeWishlist", function() {
	var link = $(this).attr("href");
	var id = $("#deleteModel #id").text();
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: link,
		data: {
			id: id
		},
		dataType: 'json',
		success: function(data) {
			$("#wishListNum").text(data);
			location.reload();
		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});
});