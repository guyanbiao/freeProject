 if($.type(Sys.ie) == 'string' &&  Number(Sys.ie) < 9){
    // ie8以及以下版本
    $("#really-video-diao-ye").remove();
}else{
  videojs(document.getElementById("really-video-diao-ye"), {
      "controls": false,
      "autoplay": true,
      "loop": true
    }, function() {
        var me = this;
         me.width(1280*0.8, true);
         me.height(720*0.8, true);
    });
}
$(function(){

})