require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  enable :sessions
  use Rack::Flash
  configure do
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user #returns true if current user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      #if there is a session[:user_id] set current user to the the user_id of the session
      # x ||= y this means x || x = y
      # so if current_user is nil or false set current_user to be the value of y.
    end
  end

end
