$(document).ready(function(){
	$(".time-countdown").each(function(index){
		$(this).countdown($(this).text(), function(event) {
		    $(this).text(
		        event.strftime('%-Dd %H:%M:%S')
		    );
		});
	});
});

