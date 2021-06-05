/**
 * 
 */

// model handle
$(document).on("click", ".deleteBtn", function() {

	var id = $(this).data("id");
	var link = $(this).data("link");
	if ($(this).data("type") == "delete") {
		$("#deleteModel #exampleModalLabel").text("Confirm Delete");
		$("#deleteModel #confirmBody").text("Are you sure to Cancel this booking? - ID = ");
		$("#deleteModel #deleteLink").text("Delete");	
		$("#deleteModel #deleteLink").addClass("btn-danger");	
	}
	
	if ($(this).data("recover") == "delete") {
		$("#deleteModel #exampleModalLabel").text("Confirm Recover");
		$("#deleteModel #confirmBody").text("Are you sure to Recover this booking? - ID = ");	
		$("#deleteModel #deleteLink").addClass("btn-success");
		$("#deleteModel #deleteLink").text("Recover");
	}
	
	$("#deleteModel #id").text(id);	
	
	$("#deleteModel #deleteLink").attr(
		"href",
		link + "?id=" + id
	);
	
});