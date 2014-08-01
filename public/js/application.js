$(document).ready(function() {
    console.log("Hello");
    var oldButton = $("#old");
    var midButton = $("#mid");
    var highButton = $("#new");
    $("#old, #mid, #new").on('click', function() {
        hideButtons();
        ajax_song("old");
    });
});

function hideButtons() {
    $("#old, #mid, #new").slideUp();
}

function showButtons() {
    $("#old, #mid, #new").slideDown();
}

function ajax_song(era) {
    var xhr = $.ajax({
        url: "/" + era,
        type: 'GET'
    }).success(function(data){
        console.log("success");
        var dataParsed = $.parseJSON( data );

        var lyrics = $("#lyrics");
        var iframeID = $("#soundcloud_iframe");

        iframe_skeleton = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/" + dataParsed.sc_track + "&amp;color=ff5500&amp;auto_play=true&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false";

        iframeID.attr("src", iframe_skeleton);
        lyrics.html(dataParsed.lyrics);
        setTimeout( "showButtons();", 5000 );

    }).fail(function(data){
        console.log("Failed");
         setTimeout( "ajax_song('old');", 5000 );
    });
}


// function gif() {
//     var gifDiv = $("#gif");
//     gif.html('<iframe src="//giphy.com/embed/1aM5GxOF9kJTG" width="500" height="250" frameBorder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>');
// }
