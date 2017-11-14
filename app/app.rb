ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class App < Sinatra::Base

  enable :sessions

  set :session_secret, 'key'

  get '/' do
  	redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:index)
  end

  get '/links/new' do
  	@confirmation_message = session[:confirmation_message]
  	erb(:new)
  end

  get '/tags/:tag' do
    @filtered_links = []
    Link.all.each do |link|
      link.tags.each do |tag|
        @filtered_links << link if tag.name == params[:tag]
      end
    end
    erb(:tags)
  end

  post '/links' do
	link = Link.new(url: params[:url], title: params[:title])
	tag = Tag.first_or_create(name: params[:tag])
	link.tags << tag
	link.save
  	session[:confirmation_message] = "#{params[:title]} has been added"
  	redirect '/links/new'
  end

  run! if app_file == $0
end
