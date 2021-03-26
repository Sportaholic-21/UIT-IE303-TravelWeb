(function() {
	var closeBtn = $("#btn-close-sidebar");
	var sidebar = $("#sidebar");
	closeBtn.click(function() {
		sidebar.css("right", "-100%");
	});
	
	var sidebarIcon = $("#sidebar-menu");
	sidebarIcon.click(function() {
		sidebar.css("right", "0");
	});
})();