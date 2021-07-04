(function() {
	const inputField = $("#search-name-input");
	
	inputField.autocomplete({
	    source: function(req, res) {
	      $.ajax({
	        url: link + "/api/searchComplete",
	        dataType: "json",
	        type: "GET",
	        data: {
	        	"query": req["term"]
	        },
	        success: function(data) {
	          res(data);
	        }, error: function(err) {
	        	alert("au");
	          console.log(err);
	        }
	      });
	    },
	
	    minLength: 1,
	    select: function(event, ui) {
	      if (ui.item) {
	      	inputField.text(ui.item.label)
	      }
	    }
	  });
	
	  $(inputField).keyup(function(event) {
	    if (event.key === 'Enter' || event.keyCode === 13) {
			$(".searchSubmitBtn").click();
	    }
	  });
})();