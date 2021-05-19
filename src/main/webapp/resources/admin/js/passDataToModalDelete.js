/**
 * 
 */

// delete
$(document).on("click", ".deleteBtn", function() {
	var id = $(this).data("id");
	var link = $(this).data("link");
	$("#deleteModel #deleteLink").attr(
		"href",
		link + "?id=" + id
	);
	$("#deleteModel #id").text(id);
});
