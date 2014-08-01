def extract_track_youtube(html)
  html_string = html.to_s
  html_string.match(/watch\?v=(\w*)/) # Grabs just the track number
  return $1
end


# def sc(url)
#   $client = Soundcloud.new(:client_id => ENV['soundcloud_key'])
#   $client.get('/oembed', :url => url, :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
# end

# def extract_track_sc(html)
#   html_string = html.to_s
#   html_string.match(/tracks%2F(\d*)/) # Grabs just the track number
#   return $1
# end

# elsif media.first.provider == "soundcloud"
#       provider = "soundcloud"
#       url = media.first.url
#       iframe_info = extract_track_sc(sc(url))
#       Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info)

songs = RapGenius.search_by_artist("Drake")
songs.each do |song|
  title = song.title
  media = song.media
  media.each do |individual_media|
    if individual_media.provider == "youtube"
      provider = "youtube"
      url = individual_media.url
      iframe_info = extract_track_youtube(url)
      Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info)
    end
  end
end
