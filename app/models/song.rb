class Song

  def initialize
    $client = Soundcloud.new(:client_id => 'c47cbaa8d972de10824f44f31fd4b529')

    #NEW
    @new_urls = 
      [ "https://soundcloud.com/octobersveryown/drake-draft-day",
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

  def new_song
    num = 1 + rand(5)
    $client.get('/oembed', :url => @new_urls[num], :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
  end

  def mid_song
    num = 1 + rand(5)
    $client.get('/oembed', :url => @mid_urls[num], :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
  end

  def old_song
    num = 1 + rand(5)
    $client.get('/oembed', :url => @old_urls[num], :auto_play => true, :show_comments => false, :maxwidth => 365, :maxheight =>166)
  end

end