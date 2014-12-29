$(function(){
	$("#demo_started_at").datepicker({
		dateFormat: "yy-mm-dd"
	});
	
	$( "#font-size-slider" ).slider({
	      min: 20,
	      max: 100,
	      step: 20,
	      slide: function( event, ele ) {
	      		$("#demo_font_size").val(ele.value);
	        	$("#font-size-value").html( ele.value + "px");
	      }
	});
	$( "#speed-slider" ).slider({
	      min: 1,
	      max: 7,
	      step: 1,
	      slide: function( event, ele ) {
	      		$("#demo_speed").val(ele.value);
	        	$( "#speed-value" ).html( ele.value );
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