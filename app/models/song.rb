class Song

  def initialize
    $client = Soundcloud.new(:client_id => ENV['soundcloud_key'])
    @songs = []
    songs = RapGenius.search_by_artist("Drake")
    songs.each do |song|
      @songs << song
    end
  end

  def rg_song_media_sc
    song = @songs.sample
    media = song.media.sample
    if media.provider == 'soundcloud'
      return [song, media]
    else
      rg_song_media_sc
    end
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

  def extract_track(html)
    html_string = html.to_s
    html_string.match(/tracks%2F(\d*)/) # Grabs just the track number
    return $1
  end

  def strip_url(url)
    url.match(/\A(\S*\/)(.*\z)/) # Split url into two capture groups - second has song info
    $2.gsub!(/-/, ' ') # Replace dashes with spaces in song title
  end

end