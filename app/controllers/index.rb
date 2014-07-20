require 'rapgenius'
require 'soundcloud'

get '/' do
  songs = RapGenius.search_by_artist("Drake")
  client = Soundcloud.new(:client_id => 'c47cbaa8d972de10824f44f31fd4b529')
  @song = songs[rand(20)]
  @lines = @song.lines
  @song.media.each do |media|
    if media.provider == 'soundcloud'
      @embed_info = client.get('/oembed', :url => media.url, :auto_play => true, :show_comments => false)
      break
    end
  end

  erb :index
end
