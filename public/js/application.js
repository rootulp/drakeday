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
    }).success(function(data){
        console.log("success");
        var dataParsed = $.parseJSON( data );

        var lyrics = $("#lyrics");
        var iframeID = $("#soundcloud_iframe");

        iframe_skeleton = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/" + dataParsed.sc_track + "&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"
        
        iframeID.attr("src", iframe_skeleton);
        lyrics.html(dataParsed.lyrics);
    }).fail(function(data){
        console.log("Failed");
    });
}

function gif() {
    var gifDiv = $("#gif");
    gif.html('<iframe src="//giphy.com/embed/1aM5GxOF9kJTG" width="500" height="250" frameBorder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>');
}
