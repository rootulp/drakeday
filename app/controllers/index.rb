require 'rapgenius'
require 'soundcloud'

get '/' do
  erb :homepage
end

get '/sc' do
  num_tracks = Track.count
  rand_track_id = rand(num_tracks) + 1
  session[:current_track] = rand_track_id
  rand_track = Track.find_by_id(rand_track_id)
  json_object = {sc_track: rand_track.iframe_info, lyrics: "bla"}.to_json
end

get '/youtube' do
  num_tracks = Track.count
  rand_track_id = rand(num_tracks) + 1
  session[:current_track] = rand_track_id
  rand_track = Track.find_by_id(rand_track_id)
  json_object = {youtube_track: rand_track.iframe_info, lyrics: rand_track.lyrics}.to_json
end

get '/delete' do
  track_id = session[:current_track]
  rand_track = Track.find_by_id(track_id)
  rand_track.delete
end