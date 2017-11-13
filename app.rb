require 'sinatra/base'

class App < Sinatra::Base

  enable :sessions

  set :session_secret, 'key'


  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
