ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

class App < Sinatra::Base

  enable :sessions

  set :session_secret, 'key'


  get '/' do
  	redirect '/links'
  end

  get '/links' do
    @links = Link.all
    p @links
    erb(:index)
  end

  get '/links/new' do
  	@confirmation_message = session[:confirmation_message]
  	erb(:new)
  end

  post '/links' do
  	Link.create(url: params[:url], title: params[:title])
  	session[:confirmation_message] = "#{params[:title]} has been added"
  	redirect '/links/new'
  end

  run! if app_file == $0
end
