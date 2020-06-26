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
        city = City.find_or_create_by(name: params[:city])
        restaurant = Restaurant.create(name: params[:name], city: city)
        if restaurant.save
            redirect to "/restaurants/#{restaurant.id}"
        else
            # put error here
            redirect to "/restaurants/new"
        end
    end
end


get '/restaurants/new' do
    verify_logged_in
    erb :'restaurants/new'
end

get '/restaurants/:id' do
    verify_logged_in
        @restaurant = Restaurant.find(params[:id])
        erb :'restaurants/show_restaurant'
end

get '/restaurants/:id/edit' do
    verify_logged_in
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit_restaurant'
end

patch '/restaurants/:id' do
    verify_logged_in
        if params[:name] == ""
            redirect to "/restaurants/#{params[:id]}/edit"
            # put error here
          else
            city = City.find_or_create_by(name: params[:city])
            restaurants = Restaurant.find_by_id(params[:id])
              if restaurants.update(name: params[:name], city: city )
                redirect to "/restaurants/#{restaurants.id}"
              else
                redirect to "/restaurants/#{restaurants.id}/edit"
                # put error here
              end
          end
      end

      delete '/restaurants/:id/delete' do
        verify_logged_in
            restaurant = Restaurant.find(params[:id])
              restaurant.delete

            # put some kind of check for mad deleting
    end

end