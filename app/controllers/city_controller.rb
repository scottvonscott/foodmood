class CityController < ApplicationController

    get '/cities' do
        verify_logged_in
        @cities = City.all
        erb :'cities/index'
    end


get '/cities/:id' do
    verify_logged_in
        @city = City.find(params[:id])
        erb :'cities/show_city'
end

get '/cities/:id/edit' do
    verify_logged_in
        @city = City.find(params[:id])
        erb :'cities/edit_city'
# Edit permission?
end

get '/cities/:id/delete_confirm' do
    verify_logged_in
    @city = City.find(params[:id])
    erb :'cities/delete_city'
  end

delete '/cities/:id/delete' do
    verify_logged_in
        city = City.find(params[:id])
          city.delete
          redirect to '/cities'
end

end