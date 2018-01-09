require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require './environments'
require './models/playlist'

get "/" do
 @title = 'Guess Whose Playlist'
 @playlists = Playlist.all
 erb :"playlist/index"
end

post "/" do
  if params[:playlist].has_key? :url
    @playlist = Playlist.new(params[:playlist])
    if @playlist.save
      redirect "/"
    else
      redirect "create"
    end
  else
    redirect "create"
  end
end

get "/create" do
  @title = 'Add your playlist - Guess Whose Playlist'
  erb :"playlist/create"
end
