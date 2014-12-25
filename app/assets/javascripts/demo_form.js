$(function(){
	$("#demo_started_at").datepicker();
	$( "#font-size-slider" ).slider({
	      value:100,
	      min: 0,
	      max: 500,
	      step: 50,
	      slide: function( event, ele ) {
	      		$("#demo_font_size").val(ele.value);
	        	$( "#demo_font_size" ).html( "$" + ele.value );
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
})