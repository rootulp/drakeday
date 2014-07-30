require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/:era' do
  song = Song.new
  @embed_info = song.new_song(params[:era])
  erb :index
end
