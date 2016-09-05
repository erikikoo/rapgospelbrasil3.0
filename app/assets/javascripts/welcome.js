function btnDown() {
	$('#teste').animate({width: '30px' ,opacity: '0.5'}, 'fast');
}

function btnUp() {
	$('#teste').animate({width: '80px' ,opacity: '1.0'}, 'fast');	
}



$(window).load(function() {	
	
	$("#mixtape-modal").modal("show");

	setTimeout(function() {
		btnDown();
	},15000);	

	// setTimeout(function() {
	// 	$("#mixtape-modal").modal("hide");
	// },15000);
});

$(document).ready(function() {	

	$('#teste').mouseover(function(event) {
		btnUp();
	});

	$('#teste').mouseout(function(event) {
		btnDown();
	});

});

