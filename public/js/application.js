$(document).ready(function() {
    console.log("Hello");
    hideSpinner();
    $("#old").on('click', function() {
        hideButtons();
        showSpinner();
        sc_song();
    });
    $("#new").on('click', function() {
        hideButtons();
        showSpinner();
        youtube_song();
    });
});

function hideButtons() {
    $("#old, #mid, #new").slideUp();
}

function showButtons() {
    $("#old, #mid, #new").slideDown();
}

function hideSpinner() {
    $(".spinner").slideUp();
}

function showSpinner() {
    $(".spinner").slideDown();
}

function sc_song() {
    var xhr = $.ajax({
        url: "/sc",
        type: 'GET'
    }).success(function(data){
        console.log("success");
        var dataParsed = $.parseJSON( data );

        var lyrics = $("#lyrics");
        var iframeID = $("#soundcloud_iframe");

        iframe_skeleton = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/" + dataParsed.sc_track + "&amp;color=ff5500&amp;auto_play=true&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false";

        iframeID.attr("src", iframe_skeleton);
        lyrics.html(dataParsed.lyrics);
        hideSpinner();
        setTimeout( "showButtons();", 5000 );

    }).fail(function(data){
        console.log("Failed");
         setTimeout( "sc_song();", 5000 );
    });
}

function youtube_song() {
    var xhr = $.ajax({
        url: "/youtube",
        type: 'GET'
    }).success(function(data){
        console.log("success");
        var dataParsed = $.parseJSON( data );

        var lyrics = $("#lyrics");
        var iframeID = $("#youtube_iframe");

        iframe_skeleton = "http://www.youtube.com/embed/" + dataParsed.youtube_track + "?autoplay=1";

        iframeID.attr("src", iframe_skeleton);
        lyrics.html(dataParsed.lyrics);
        hideSpinner();
        setTimeout( "showButtons();", 5000 );

    }).fail(function(data){
        console.log("Failed");
         setTimeout( "youtube_song();", 5000 );
    });
}
