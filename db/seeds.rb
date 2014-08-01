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


def sc(url)
  $client.get('/oembed', :url => url, :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
end

def resolve_track(url)
  $client.get('/resolve', :url => url)
end

def extract_track_sc(html)
  html_string = html.to_s
  html_string.match(/tracks%2F(\d*)/) # Grabs just the track number
  return $1
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
    # lyrics = "not defined yet"
    # era = "old"
    Track.create(title: title, provider: provider, url: url, iframe_info: iframe_info)
  end
end

seed_rapgenius
seed_soundcloud