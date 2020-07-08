require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SUPER_DUPER_SECRET_SESSION']
    set :show_exceptions, false
  end

  get "/" do
    erb :index
  end

  not_found do
    status 404
    erb :error
  end

  error ActiveRecord::RecordNotFound do
    erb :error
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def admin?
      unless current_user.admin
        redirect to 'users/user_error'
      end
    end

    def verify_logged_in
      unless logged_in?
          redirect to "/login"
      end
    end

  end

end
