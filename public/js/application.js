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

function hideSoundCloud() {
    $("#soundcloud_iframe").attr("src", "")
    $("#soundcloud_iframe").slideUp();
}

function hideYouTube() {
    $("#youtube_iframe").attr("src", "")
    $("#youtube_iframe").slideUp();
}

function showSoundCloud() {
    $("#soundcloud_iframe").slideDown();
}

function showYouTube() {
    $("#youtube_iframe").slideDown();
}

function sc_song() {
    var xhr = $.ajax({
        url: "/sc",
        type: 'GET'
    }).success(function(data){
        console.log("success");
        var dataParsed = $.parseJSON( data );

        iframe_skeleton = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/" + dataParsed.sc_track + "&amp;color=ff5500&amp;auto_play=true&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false";

        $("#soundcloud_iframe").attr("src", iframe_skeleton);
        $("#lyrics").html(dataParsed.lyrics);

        hideSpinner();
        hideYouTube();
        showSoundCloud();

        setTimeout( "showButtons();", 2500 );

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

        iframe_skeleton = "http://www.youtube.com/embed/" + dataParsed.youtube_track + "?autoplay=1";

        $("#youtube_iframe").attr("src", iframe_skeleton);
        $("#lyrics").html(dataParsed.lyrics);

        hideSpinner();
        hideSoundCloud();
        showYouTube();

        setTimeout( "showButtons();", 2500 );

    }).fail(function(data){
        console.log("Failed");
         setTimeout( "youtube_song();", 5000 );
    });
}

$(document).ready(function() {
    console.log("Hello");
    hideSpinner();
    hideYouTube();
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
