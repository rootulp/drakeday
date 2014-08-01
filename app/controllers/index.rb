require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/:era' do
  song = Song.new
  rg_song, rg_media =  song.rg_song_media_sc # Set rg_song and rg_media to the song and media info in a rg song
  sc = song.sc(rg_media.url) # Get embedable SC object using rg media url (a soundcloud link)
  sc_stripped = song.extract_track(sc)
  lyrics = song.lyrics(rg_song.lines) # Take RG lyrics and throw them into one long string
  json_object = {sc_track: sc_stripped, lyrics: lyrics}.to_json
end