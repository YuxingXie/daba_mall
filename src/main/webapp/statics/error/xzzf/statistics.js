var statistics = {};
/**
 * @author nbxzzf
 * 统计分析鼠标在td中移入移出效果
 * @return
 */
statistics.mouseTdXiaoguo = function(){
	$("#heightLightTable td").mouseover(function(){
		$(this).css('background-color','#F2F9FF');
	}).mouseout(function(){
		$(this).css('background-color','#ffffff');
	});
}

function numberOneZero(val){
	var fmt = val.split(".");
	if(fmt.length > 1 && fmt[1] == 0){
		return fmt[0];
	}else{
		return val;
	}
}
