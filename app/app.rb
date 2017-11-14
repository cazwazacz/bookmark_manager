require 'sinatra/base'
require_relative 'models/link'

class App < Sinatra::Base

  enable :sessions

  set :session_secret, 'key'


  get '/links' do
    @links = Link.all
    erb(:index)
  end

  run! if app_file == $0
end
