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
      admin?
      @city = City.find(params[:id])
      erb :'cities/edit_city'
  end

  patch '/cities/:id' do
      verify_logged_in
      admin?
          if params[:name] == ""
              redirect to "/cities/#{params[:id]}/edit"
          else
            cities = City.find_by_id(params[:id])
              if cities.update(name: params[:name])
                redirect to "/cities/#{cities.id}"
              else
                redirect to "/cities/#{cities.id}/edit"
              end
          end
  end

  get '/cities/:id/delete_confirm' do
      verify_logged_in
      admin?
      @city = City.find(params[:id])
      erb :'cities/delete_city'
    end

  delete '/cities/:id/delete' do
      verify_logged_in
      admin?
      city = City.find(params[:id])
      city.delete
      redirect to '/cities'
  end

end