require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/new' do
  song = Song.new
  @embed_info = song.new_song
  erb :index
end

get '/mid' do
  song = Song.new
  @embed_info = song.mid_song
  erb :index
end
