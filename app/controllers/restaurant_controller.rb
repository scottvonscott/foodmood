class RestaurantController < ApplicationController

  get '/restaurants' do
      verify_logged_in
      @restaurants = Restaurant.all
      erb :'restaurants/index'
  end

  get '/restaurants/:id' do
      verify_logged_in
      @restaurant = Restaurant.find(params[:id])
      erb :'restaurants/show_restaurant'
  end

  get '/restaurants/:id/edit' do
      verify_logged_in
      admin?
      @restaurant = Restaurant.find(params[:id])
      erb :'restaurants/edit_restaurant'
  end

  patch '/restaurants/:id' do
    verify_logged_in
    admin?
        if params[:name] == ""
            redirect to "/restaurants/#{params[:id]}/edit"
        else
          city = City.find_or_create_by(name: params[:city])
          restaurant = Restaurant.find_by_id(params[:id])
            if restaurant.update(name: params[:name], city: city)
              redirect to "/restaurants/#{restaurant.id}"
            else
              redirect to "/restaurants/#{restaurant.id}/edit"
            end
        end
  end
        
  get '/restaurants/:id/delete_confirm' do
      verify_logged_in
      admin?
      @restaurant = Restaurant.find(params[:id])
      erb :'restaurants/delete_restaurant'
  end

  delete '/restaurants/:id/delete' do
    verify_logged_in
    admin?
    restaurant = Restaurant.find(params[:id])
    restaurant.delete
    redirect to '/restaurants'
  end

end