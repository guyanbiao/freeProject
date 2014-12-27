/**=========================判断浏览器类型以及版本========================**/
Sys = (function(){
	var Sys = {};  var ua = navigator.userAgent.toLowerCase();    var s;    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	return Sys;
})();

Lib = (function(){
	var lib = {};
 	lib.mergeRecursive = function (obj1, obj2) {
	  for (var p in obj2) {
	    try {
	      if ( obj2[p].constructor==Object ) {
	        obj1[p] = MergeRecursive(obj1[p], obj2[p]);
	      } else {
	        obj1[p] = obj2[p];
	      }
	    } catch(e) {
	      obj1[p] = obj2[p];
	    }
	  }
  	return obj1;
	}
    return lib;
})();

Api = (function(){
	var api = {};
	api.get = function(url, params, complete, success, error, beforeSend){
		$.ajax({
			url:  url,
			type: 'GET',
			dataType: 'json',
			data: params,
			beforeSend: beforeSend
		})
		.done(success)
		.fail(error)
		.always(complete);
	};

	api.post = function(url, params, complete, success, error, beforeSend){
		$.ajax({
			url:  url,
			type: 'POST',
			dataType: 'json',
			data: params,
			beforeSend: beforeSend
		})
		.done(success)
		.fail(error)
		.always(complete);
	};

	api.put = function(url, params, complete, success, error, beforeSend){
		$.ajax({
			url:  url,
			type: 'PUT',
			dataType: 'json',
			data: params,
			beforeSend: beforeSend
		})
		.done(success)
		.fail(error)
		.always(complete);
	};
	return api;
})();