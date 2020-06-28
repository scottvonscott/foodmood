class UserController < ApplicationController

    get '/signup' do
        erb :'users/new' 
    end

    post '/signup' do
        user = User.create(username: params[:user][:username], password: params[:user][:password], admin: false)
        if user.save
            session[:user_id] = user.id
            redirect '/home'
        else
            erb :'users/new'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end

    get '/login' do
        erb :'users/login'
    end

    get '/home' do
        verify_logged_in
        erb :'users/index'
    end

    get '/users/user_error' do
        verify_logged_in
        erb :'users/error'
    end

    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect '/home'
        else
            redirect '/login'
        end
    end

end



