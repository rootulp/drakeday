class Song

  def initialize
    $client = Soundcloud.new(:client_id => ENV['soundcloud_key'])

    #NEW
    @new_urls = 
      ["https://soundcloud.com/octobersveryown/drake-draft-day",
      "https://soundcloud.com/octobersveryown/drake-0-to-100",
      "https://soundcloud.com/ob-obrien/ob-obrien-2-onthotful-feat-drake",
      "https://soundcloud.com/partyomo/partynextdoor-recognize-feat-drake",
      "https://soundcloud.com/octobersveryown/drake-trophies"]
      #MID
      @mid_urls = 
      ["https://soundcloud.com/octobersveryown/drake-hold-on-were-going-home",
      "https://soundcloud.com/octobersveryown/drake-5am-in-toronto",
      "https://soundcloud.com/octobersveryown/drake-the-motto-feat-lil-wayne",
      "https://soundcloud.com/octobersveryown/drake-started-from-the-bottom",
      "https://soundcloud.com/octobersveryown/lil-wayne-she-will-feat-drake"]

      @old_urls = 
      ["https://soundcloud.com/aliyahra/drake-successful",
      "https://soundcloud.com/ladygagaradio-tm-1/drake-forever",  
      "https://soundcloud.com/clarkelan-blogspot-com/07-drake-fancy-ft-t-i-swizz-beatz",
      "https://soundcloud.com/ladygagaradio-tm-1/drake-marvin-room",
      "https://soundcloud.com/xplayboyx1313/drake-headlines-take-care-2011"]

    end

  def soundcloud_url(era)
    num = 1 + rand(5)
    case era
    when 'new'
      @new_urls[num]
    when 'mid'
      @mid_urls[num]
    when 'old'
      @old_urls[num]
    end
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
  end

end