class Song

  def initialize
    $client = Soundcloud.new(:client_id => ENV['soundcloud_key'])
    @songs = []
    songs = RapGenius.search_by_artist("Drake")
    songs.each do |song|
      song.media.each do |media|
        if media.provider == 'soundcloud'
          @songs << song
        end
      end
    end
  end

  def random_url()
    song = @songs.sample.media.first.url
  end

  def soundcloud_embedable(url)
      $client.get('/oembed', :url => url, :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
  end

  def strip_url(url)
    url.match(/\A(\S*\/)(.*\z)/) # Split url into two capture groups - second has song info
    $2.gsub!(/-/, ' ') # Replace dashes with spaces in song title
  end

  def get_lyrics(stripped_url)
    songs = RapGenius.search(stripped_url)
    lyrics = songs[0].lines
    text = ""
    lyrics.each do |line|
      text += line.lyric
    end
    return text
  end

end