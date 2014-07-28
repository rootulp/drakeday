console.log("Hello");
$(document).ready(function() {
    $("#old").on('click', function() {
        ajax_song("old");
    });  
    $("#mid").on('click', function() {
        ajax_song("mid");
    });  
    $("#new").on('click', function() {
        ajax_song("new");
    });
});

function ajax_song(era) {
    console.log(era);
    var xhr = $.ajax({
        url: "/" + era,
        type: 'GET'
    }).done(function(data){
        var soundCloudClient = $("#soundcloud_client");
        var dataParsed = $.parseHTML(data);
        embedable = dataParsed[11];
        soundCloudClient.html(embedable);
    });
}

