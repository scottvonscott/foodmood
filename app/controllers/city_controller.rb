class CityController < ApplicationController

    get '/cities' do
        verify_logged_in
        @cities = City.all
        binding.pry
        erb :'cities/index'
    end

    get '/cities/new' do
        verify_logged_in
        erb :'cities/new'
    end

    # post '/cities' do
    #     verify_logged_in
    #       if params[:name] == ""
    #         # put error here
    #         redirect to "/cities/new"
    #       else
    #         @city = City.create(name: params[:name])
    #         if @city.save
    #           redirect to "/cities/#{@city.id}"
    #         else
    #           # put error here
    #           redirect to "/cities/new"
    #         end
    #       end
    #   end
end