   if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showLocation);
      //alert("Geotrack working...");
    }
   function add(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showLocation);
      //alert("Geotrack working...");
    } 
    //showLocation(position);

   }
    
  function showLocation(position){
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    var freightid = 1; //this is used to identify the freight
  $.ajax({
    type: 'POST',
    url: 'save/getlocation.php', //php to save the tracked locations
    data: 'latitude=' + latitude + '&freightid=' + freightid + '&longitude=' + longitude, //data with coordinates
    success: function(msg) {
      if (msg) {
        console.log("Success");
      } else {
        console.log("Very Bad"); 
      }
       setTimeout(function() {
         add();//this will send request again and again after 4 seconds or time you want. For your case i set it seconds for patients sake
      }, 4000);
    }
  });

}