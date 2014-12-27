$(function(){
	var mapper = {show_user_name: "showUserName", show_user_avatar: "showUserAvatar"};
	var datas = new Array();
	$.each($("#configration_show_user_name, #configration_show_user_avatar"), function(index, val) {
		if(($(val).attr("id") || "").indexOf('configration_') > -1){
			var fieldName = $(val).attr("id").split("configration_")[1];
			(function(ele){
				$(document).on('click', "#"+$(val).attr("id") , function(event) {
					var ops = {}; ops[$(val).attr("name")] = $(val).prop('checked');
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

	$("#configration_model").change(function(){
		var ops = {}; ops[$(this).attr("name")] = $(this).val();
		Api.put("/configrations/" + Options.configrationId , ops, function(){
					//always
				}, function(data, status){
					// success
					if(data.success){
						delete data.success;
						Options.model = Number(data.model);
					}
				}, function(){
					// fail
				}, function(){

			});
	});

	$.each($(".footer .btn"), function(index, ele){
		(function(e){
			$(document).on('click', "#" + $(ele).attr('id'), function(){
				if($(ele).attr("id") == "ss"){
						//点击开始按钮
					Options.isStarted = !Options.isStarted;
					$(ele).html(Options.isStarted ? "结束" : "开始");
					if(!Options.isStarted){ Options.isStop = false, $("#sc").html('暂停')}
					updateDemoStatus();
				}else if($(ele).attr("id") == "sc"){
						//点击继续按钮
					if(Options.isStarted){
						Options.isStop = !Options.isStop;
						$(ele).html(Options.isStop ? "继续" : "暂停");
						updateDemoStatus();
					}else{
						alert("请开始弹幕")
					}
				}else{
					// 其他情况
				}
				
			})
		})(ele);
	});
	
	function updateDemoStatus(){
		var ops = {}; ops["configration[is_started]"] = Options.isStarted, ops["configration[is_stop]"] = Options.isStop;
				Api.put("/configrations/" + Options.configrationId , ops, function(){
					//always
				}, function(data, status){
					// success
					if(data.success){
						delete data.success;
						managerDemo(Options.rate);
					}else{
						location.reload();
						alert("更新失败");
					}
				}, function(){
					// fail
				}, function(){

				});
	}

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
	      step: 2,
	      slide: function( event, ele ) {
	      		$("#configration_rate").val(ele.value);
	        	$( "#rate" ).html( ele.value +"秒");
	        	var ops = {}; ops["configration[rate]"] = ele.value;
       		Api.put("/configrations/" + Options.configrationId , ops, function(){
					//always
				}, function(data, status){
					// success
					if(data.success){
						delete data.success;
						Options.rate = Number(data.rate);
					}
				}, function(){
					// fail
				}, function(){

			});       		
	      }
	});
	
	function clearTimers(){
		if(Options.timer) clearInterval(Options.timer);
		if(Options.readDataTimer) clearInterval(Options.readDataTimer);
		if(Options.historyDataTimer) clearInterval(Options.historyDataTimer);
	}

	function managerDemo(rate){
		clearTimers();
		if(Options.isStarted){
			readMessage(Options.rate);
			pastRecords(Options.rate);
			if(!Options.isStop){
				//继续
				Options.timer = setInterval(function(){
					var d = datas.shift();
					if(typeof d === "object"){
						console.log(d);
						Api.put("/contents/" + d.id , {demo_id: Options.demoId}, function(){
						//always
						}, function(data, status){
							// success
							console.log("=====================================")
							console.log(status)
							$(".read .content-panel").prepend($(".unread .content-panel #"+ d.id).remove());
						}, function(){
							// fail
						}, function(){

						}); 
						}      		
					}, Number(Options.rate) * 1000);		
			}else{
				//暂停
				clearInterval(Options.timer);
			}
		}else{
			clearTimers();
		}
	}

	function  readMessage(rate){
		if(typeof rate == "undefined") rate = Options.rate;
		Options.readDataTimer = setInterval(function(){
			Api.get("/demos/unread", {
				id: Options.demoId
			}, function(){
				//always
			}, function(data, status){
				// success
				datas = data;
				var result = '';
				for (var i = 0; i < data.length; i++) {
					result+=parseMessage2Html(data[i]);
					// $(".unread .content-panel").append(parseMessage2Html(data[i]));
				};
				$(".unread .content-panel").html(result);
			}, function(){
				// fail
			}, function(){

			})
		}, Number(rate) * 510);
	};
	function pastRecords(rate){
		if(typeof rate == "undefined") rate = Options.rate;
		Options.historyDataTimer = setInterval(function(){
			Api.get("/demos/read", {
				id: Options.demoId
			}, function(){
				//always
			}, function(data, status){
				// success
				console.log("历史数据");
				var result = "";
				for (var i = 0; i < data.length; i++) {
					result+=parseMessage2Html(data[i]);
					// $(".unread .content-panel").append(parseMessage2Html(data[i]));
				};
				$(".read .content-panel").html(result);
			}, function(){
				// fail
			}, function(){

			})
		}, Number(rate) * 520);
	};

	function parseMessage2Html(msg){
		return (function(m){
			var html = '<div class="ele col-sm-12 col-md-12" id="' + m.id + '">'+
					'<div class="avatar"><img src="/assets/rails.png"></div>'+
						'<div class="content">'+
							'<div class="name">' + "用户名" + '<span style="float:right;">'+m.published_at+'</span></div>'+
							'<div class="message">'+m.content+'</div>'+
						'</div>'+
					'</div>';
					return html;
		})(msg);
	}

	readMessage();
	pastRecords();
	managerDemo(Options.rate);
})