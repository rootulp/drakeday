require 'rapgenius'
require 'soundcloud'

get '/' do
  songs = RapGenius.search_by_artist("Drake")
  @song = songs[rand(20)]
  @media = @song.media.first

  # create a client object with your app credentials
  client = Soundcloud.new(:client_id => 'c47cbaa8d972de10824f44f31fd4b529')

  # get a tracks oembed data
  track_url = 'http://soundcloud.com/forss/flickermood'
  @embed_info = client.get('/oembed', :url => track_url)

  erb :index
end
