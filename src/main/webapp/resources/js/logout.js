/**
 * 
 */

if (document.getElementById('signOut')) {
	var signOut = document.getElementById("signOut");
	var urlCurrent = window.location.href;
	signOut.addEventListener("click", () => {
		axios.post("/UIT-IE303-TravelWeb/signOut")
			.then(function(res) { window.location = urlCurrent })
			.catch(function(err) { console.log(err) })
	})	
}
