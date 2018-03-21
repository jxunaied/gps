  //This File Is Nothing Just For Example


  $.ajax({
    type: 'POST',
    url: 'save/getloc.php', //php to save the tracked locations
    success: function(msg) {
      if (msg) {
        pos=msg;
      } else {
        console.log("Very Bad"); 
      }
       setTimeout(function() {
         add();//this will send request again and again after 4 seconds or time you want. For your case i set it seconds for patients sake
      }, 4000);
    }
  });
}