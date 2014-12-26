$(function(){
	console.log(Options);
	var mapper = {show_user_name: "showUserName", show_user_avatar: "showUserAvatar"}
	$.each($("#configration_show_user_name, #configration_show_user_avatar"), function(index, val) {
		if(($(val).attr("id") || "").indexOf('configration_') > -1){
			var fieldName = $(val).attr("id").split("configration_")[1];
			(function(ele){
				$(document).on('click', "#"+$(val).attr("id") , function(event) {
					var ops = {}; ops["id"] = Options.demoId, ops[$(val).attr("name")] = $(val).prop('checked');
					Api.put("/configrations/" + Options.configrationId , ops, function(){
						//always
					}, function(data, status){
						// success
						if(data.success){
							delete data.success;
							Options[mapper[fieldName]] = JSON.parse(data[fieldName]);
							// Lib.mergeRecursive(Options, data);
						}
					}, function(){
						// fail
					}, function(){

					})
				});
			})(val);
		};
	});
	
	$( "#font-size-slider" ).slider({
	      value: Options.fontSize,
	      min: 20,
	      max: 100,
	      step: 20,
	      slide: function( event, ele ) {
	      		console.log(ele.value)
	      		$("#demo_font_size").val(ele.value);
	        	$( "#fontSize" ).html( ele.value + "px" );
	      }
	});
	$( "#speed-slider" ).slider({
	      value: Options.speed,
	      min: 1,
	      max: 7,
	      step: 1,
	      slide: function( event, ele ) {
	      		$("#configration_speed").val(ele.value);
	        	$( "#speed" ).html( ele.value );
	      }
	});
	$( "#rate-slider" ).slider({
	      value: Options.rate,
	      min: 1,
	      max: 15,
	      step: 3,
	      slide: function( event, ele ) {
	      		$("#configration_rate").val(ele.value);
	        	$( "#rate" ).html( ele.value +"秒");
	      }
	});
	
	function  readMessage(rate){
		if(typeof rate == "undefined") rate = Options.rate;
		// Options.readTimer = setInterval(function(){
		// 	Api.get("/demos/read", {
		// 		id: Options.demoId
		// 	}, function(){
		// 		//always
		// 	}, function(data, status){
		// 		// success
		// 		console.log(data)
		// 	}, function(){
		// 		// fail
		// 	}, function(){

		// 	})
		// }, Number(rate) * 400);
	};
	function pastRecords(rate){
		if(typeof rate == "undefined") rate = Options.rate;
		// Options.pastTimer = setInterval(function(){
		// 	Api.get("/demos/unread", {
		// 		id: Options.demoId
		// 	}, function(){
		// 		//always
		// 	}, function(data, status){
		// 		// success
		// 		console.log("历史数据")
		// 	}, function(){
		// 		// fail
		// 	}, function(){

		// 	})
		// }, Number(rate) * 400);
	}
	readMessage();
	pastRecords();
})