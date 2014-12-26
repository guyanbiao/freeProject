$(function(){
	$("#demo_started_at").datepicker();
	$( "#font-size-slider" ).slider({
	      value:100,
	      min: 0,
	      max: 500,
	      step: 50,
	      slide: function( event, ele ) {
	      		$("#demo_font_size").val(ele.value);
	        	$("#demo_font_size").html( "$" + ele.value );
	      }
	});
	$( "#speed-slider" ).slider({
	      value:100,
	      min: 0,
	      max: 500,
	      step: 50,
	      slide: function( event, ele ) {
	      		$("#demo_speed").val(ele.value);
	        	$( "#speed_value" ).html( "$" + ele.value );
	      }
	});

	$("#new_demo").validate({
		"rules":{
			"demo[name]":{
				required: true,
				minlength: 3
			},
			"demo[started_at]":{
				required: true,
				date: true
			}
		},
		"messages":{
			"demo[name]":{
				required: "请输入活动名称",
				minlength: "最小长度{0}"
			},
			"demo[started_at]":{
				required: "请输入开始时间",
				date: "日期格式错误"
			}
		}
	});
})