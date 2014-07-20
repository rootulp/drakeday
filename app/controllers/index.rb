require 'rapgenius'
require 'soundcloud'

get '/' do
  songs = RapGenius.search_by_artist("Drake")
  @song = songs[rand(20)]
  @media = @song.media.first
  if @media.provider == 'soundcloud'
     client = Soundcloud.new(:client_id => 'c47cbaa8d972de10824f44f31fd4b529')
     track_url = @media.url
    @embed_info = client.get('/oembed', :url => track_url)
  end

  erb :index
end
