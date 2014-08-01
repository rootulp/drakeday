require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/sc' do
  tracks = Track.where("provider = ?", 'soundcloud')
  rand_track = tracks.sample
  session[:current_track] = rand_track.id
  json_object = {sc_track: rand_track.iframe_info, lyrics: "bla"}.to_json
end

get '/youtube' do
  tracks = Track.where("provider = ?", 'youtube')
  rand_track = tracks.sample
  session[:current_track] = rand_track.id
  json_object = {youtube_track: rand_track.iframe_info, lyrics: rand_track.lyrics}.to_json
end

get '/delete' do
  track_id = session[:current_track]
  rand_track = Track.find_by_id(track_id)
  rand_track.delete
end