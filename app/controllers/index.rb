require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/sc' do
  song = Song.new
  rg_song, rg_media =  song.rg_song_media("soundcloud") # Set rg_song and rg_media to the song and media info in a rg song
  sc = song.sc(rg_media.url) # Get embedable SC object using rg media url (a soundcloud link)
  sc_stripped = song.extract_track_sc(sc) # Strips soundcloud embedable for track number to embed in iframe
  lyrics = song.lyrics(rg_song.lines) # Take RG lyrics and throw them into one long string
  json_object = {sc_track: sc_stripped, lyrics: lyrics}.to_json
end

get '/youtube' do
  song = Song.new
  rg_song, rg_media =  song.rg_song_media("youtube")
  youtube_stripped = song.extract_track_youtube(rg_media.url)
  lyrics = song.lyrics(rg_song.lines) # Take RG lyrics and throw them into one long string
  json_object = {youtube_track: youtube_stripped, lyrics: lyrics}.to_json
end