class RestaurantController < ApplicationController

    get '/restaurants'
    verify_logged_in
    @restaurants = Restaurants.all
    erb :'restaurants/index'
end

post '/restaurants' do
    verify_logged_in
end

get '/restaurants/new' do
    verify_logged_in
    erb :'restaurants/new'
end



end