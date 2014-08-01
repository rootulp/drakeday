def extract_track_youtube(html)
  html_string = html.to_s
  html_string.match(/watch\?v=(\w*)/) # Grabs just the track number
  return $1
end

songs = RapGenius.search_by_artist("Drake")
songs.each do |song|
  title = song.title
  media = song.media
  if media.first.provider == "youtube"
    provider = "youtube"
    url = media.first.url
    iframe_info = extract_track_youtube(url)
    Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info)
  # elsif media.first.provider == "soundcloud"
  #   provider = "soundcloud"
  #   url = media.first.url
  #   iframe_info = extract_track_sc(sc(url))
  #   Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info)
  end
end
