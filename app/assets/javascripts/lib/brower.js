/**=========================判断浏览器类型以及版本========================**/
Sys = (function(){
	var Sys = {};  var ua = navigator.userAgent.toLowerCase();    var s;    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	return Sys;
})()