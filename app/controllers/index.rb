require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/:era' do
  song = Song.new
  rg_song_media = song.rg_song_media
  rg_song = rg_song_media[0]
  rg_media = rg_song_media[1]
  sc_url = rg_media.url
  lyrics = song.lyrics(rg_song.lines)
  sc = song.sc(sc_url)
  json_object = {soundcloud_embedable: sc, lyrics: lyrics}.to_json
end