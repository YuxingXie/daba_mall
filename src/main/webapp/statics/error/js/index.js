$(document).ready(function(){
	$(".menu a").each(function(){
		$(this).bind("click",function(){
	    	$("#left a").css('color','#666');
	    	$(this).css("color","blue");
		});
	});

});

