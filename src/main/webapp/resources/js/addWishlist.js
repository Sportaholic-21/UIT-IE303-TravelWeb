/**
 * 
 */
 $("#success-anouncement").css({"top": screen.height/2, "left": screen.width/2});
 $("#exists-anounncement").css({"top": screen.height/2, "left": screen.width/2});

$("#success-anouncement").hide();
$("#exists-anounncement").hide();

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
			var numOfExists = parseInt($("#wishListNum").text());
			
			if (numOfExists == data) {
				$("#exists-anounncement").show();
				
				setTimeout(function(){
  					$("#exists-anounncement").hide();
				}, 1500);
			} else {
				$("#wishListNum").text(data);
				
				$("#success-anouncement").show();
				
				setTimeout(function(){
  					$("#success-anouncement").hide();
				}, 1500);
			}
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