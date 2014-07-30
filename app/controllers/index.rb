require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/:era' do
  song = Song.new
  @soundcloud_url = song.soundcloud_url(params[:era])
  @soundcloud_embedable = song.soundcloud_embedable(@soundcloud_url)
  erb :index
end
