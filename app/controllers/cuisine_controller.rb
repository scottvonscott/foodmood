class CuisineController < ApplicationController

    get '/cuisines' do
        verify_logged_in
        @cuisines = Cuisine.all_sorted
        erb :'cuisines/index'
    end
    
    get '/cuisines/:id' do
        verify_logged_in
        @cuisine = Cuisine.find(params[:id])
        erb :'cuisines/show_cuisine'
    end
    

    end