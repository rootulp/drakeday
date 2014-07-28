console.log("Hello");
$(document).ready(function() {
    var oldButton = $("#old");
    var midButton = $("#mid");
    var newButton = $("#new");

    $(document).on('click', midButton, function(event) {
        event.preventDefault();
        ajax_song();
      });  
});

function ajax_song() {
  var xhr = $.ajax({
    url: "/mid",
    type: 'GET'
  }).done(function(data){
    var soundCloudClient = $("#soundcloud_client");
    var dataParsed = $.parseHTML(data);
    embedable = dataParsed[11];
    console.log(typeof embedable);
    console.log( embedable);
    soundCloudClient.html(embedable);
  });
}

