require 'sinatra/base'
require './app/models/link.rb'

class Bookmark_manager < Sinatra::Base
  get '/' do
    "Hello World"
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end