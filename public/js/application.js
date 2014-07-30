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
    var xhr = $.ajax({
        url: "/" + era,
        type: 'GET'
    }).done(function(data){
        var client = $("#soundcloud_client");
        var lyrics = $("#lyrics");
        var dataParsed = $.parseHTML(data);
        soundCloudEmbedable = dataParsed[11];
        songLyrics = dataParsed[13];
        client.html(soundCloudEmbedable);
        lyrics.html(songLyrics);
    });
}

function gif() {
    var gifDiv = $("#gif");
    gif.html('<iframe src="//giphy.com/embed/1aM5GxOF9kJTG" width="500" height="250" frameBorder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>');
}