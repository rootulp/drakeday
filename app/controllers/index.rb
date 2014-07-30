require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/:era' do
  song = Song.new
  @soundcloud_url = song.soundcloud_url(params[:era])
  stripped_url = song.strip_url(@soundcloud_url)
  @lyrics = song.get_lyrics(stripped_url)
  @soundcloud_embedable = song.soundcloud_embedable(@soundcloud_url)
  erb :index
end
