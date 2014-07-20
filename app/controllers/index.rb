require 'rapgenius'
require 'soundcloud'

get '/' do
  songs = RapGenius.search_by_artist("Drake")
  @song = songs[rand(20)]
  @media = @song.media.first
  @lines = @song.lines
  if @media.provider == 'soundcloud'
     client = Soundcloud.new(:client_id => 'c47cbaa8d972de10824f44f31fd4b529')
     track_url = @media.url
    @embed_info = client.get('/oembed', :url => track_url, :auto_play => true)
  end

  erb :index
end
