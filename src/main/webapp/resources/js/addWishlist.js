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
			console.log(data)
		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});
});