class RestaurantController < ApplicationController

get '/restaurants' do
    verify_logged_in
    @restaurants = Restaurants.all
    erb :'restaurants/index'
end

post '/restaurants' do
    verify_logged_in
    if params[:name] == ""
        # put error here
        redirect to "/restaurants/new"
    else
        @restaurant = current_user.restaurants.build(name: params[:name], city: params[:city])
        if @restaurant.save
            redirect to "/restaurant/#{@restaurant.id}"
        else
            # put error here
            redirect to "/restaurant/new"
        end
    end
end

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