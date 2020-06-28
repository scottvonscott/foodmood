class CuisineController < ApplicationController

    get '/cuisines' do
        verify_logged_in
        @cuisines = Cuisine.all
        erb :'cuisines/index'
    end
    
    get '/cuisines/:id' do
        verify_logged_in
            @cuisine = Cuisine.find(params[:id])
            erb :'cuisines/show_cuisine'
    end
    
    get '/cuisines/:id/edit' do
        verify_logged_in
        @cuisine = Cuisine.find(params[:id])
        erb :'cuisines/edit_cuisine'
    end
    
    patch '/cuisines/:id' do
        verify_logged_in
            if params[:name] == ""
                redirect to "/cuisines/#{params[:id]}/edit"
                # put error here
              else
                cuisines = Cuisine.find_by_id(params[:id])
                  if cuisines.update(name: params[:name], city: city )
                    redirect to "/cuisines/#{cuisines.id}"
                  else
                    redirect to "/cuisines/#{cuisines.id}/edit"
                    # put error here
                  end
              end
          end
          
    get '/cuisines/:id/delete_confirm' do
        verify_logged_in
        @cuisine = Cuisine.find(params[:id])
        erb :'cuisines/delete_cuisine'
    end
    
          delete '/cuisines/:id/delete' do
            verify_logged_in
                cuisine = Cuisine.find(params[:id])
                  cuisine.delete
                  redirect to '/cuisines'
    
        end
    
    end