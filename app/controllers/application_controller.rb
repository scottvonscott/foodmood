require './config/environment'
configure do
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "super_secret_session"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id])
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

end
