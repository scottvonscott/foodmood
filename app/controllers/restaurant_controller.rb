class RestaurantController < ApplicationController

get '/restaurants' do
    verify_logged_in
    @restaurants = Restaurant.all
    erb :'restaurants/index'
end

post '/restaurants' do
    verify_logged_in
    if params[:name] == ""
        # put error here
        redirect to "/restaurants/new"
    else
        @city = City.find_or_create_by(name: params[:city])
        @restaurant = Restaurant.create(name: params[:name], city: @city)
        if @restaurant.save
            redirect to "/restaurants/#{@restaurant.id}"
        else
            # put error here
            redirect to "/restaurants/new"
        end
    end
end

# THIS IS THE CODE I WANTED TO USE:
# @restaurant = Restaurant.create(name: params[:name], city: @city.id)

get '/restaurants/new' do
    verify_logged_in
    erb :'restaurants/new'
end

get '/restaurants/:id' do
    verify_logged_in
        @restaurant = Restaurant.find_by_id(params[:id])
        erb :'restaurants/show_restaurant'
end



end