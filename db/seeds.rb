$client = Soundcloud.new(:client_id => ENV['soundcloud_key'])

def extract_track_youtube(html)
  html_string = html.to_s
  html_string.match(/watch\?v=(\w*)/) # Grabs just the track number
  return $1
end

def lyrics(lines)
  text = ""
  lines.each do |line|
    text += line.lyric
  end
  return text
end

def lyrics_for_song(title)
  song = RapGenius.search_by_title(title).first
  if song
    lines = song.lines
    lyrics = lyrics(lines)
  end
  return lyrics
end

def seed_rapgenius
  songs = RapGenius.search_by_artist("Drake")
  songs.each do |song|
    title = song.title
    media = song.media
    lines = song.lines
    lyrics = lyrics(lines)
    media.each do |individual_media|
      if individual_media.provider == "youtube"
        provider = "youtube"
        url = individual_media.url
        iframe_info = extract_track_youtube(url)
        Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info, lyrics: lyrics)
      end
    end
  end
end

def seed_soundcloud
  tracks = $client.get('/tracks', :q => 'drake')
  tracks.each do |track|
    title = track['title']
    provider = "soundcloud"
    url = track['permalink_url']
    iframe_info = track['id']
    lyrics = lyrics_for_song(title)
    Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info, lyrics: lyrics)
  end
end

seed_rapgenius
seed_soundcloud
#lyrics_for_song("0 to 100")