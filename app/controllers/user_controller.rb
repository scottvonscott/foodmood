class UserController < ApplicationController

    get '/signup' do
        erb :'users/new' 
    end

    post '/signup' do
        user = User.create(params[:user])
        binding.pry
        if user.save
            session[:user_id] = user.id
            redirect '/login'
        else
            erb :'users/new'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/login'
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            erb :'users/index'
        else
            redirect '/login'
        end
    end

end



