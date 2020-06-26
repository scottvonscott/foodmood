class CityController < ApplicationController

    get '/cities' do
        verify_logged_in
        @cities = City.all
        erb :'cities/index'
    end

    # get '/cities/new' do
    #     verify_logged_in
    #     erb :'cities/new'
    # end

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


get '/cities/:id' do
    verify_logged_in
        @city = City.find_by_id(params[:id])
        erb :'cities/show_city'
end

get '/cities/:id/edit' do
    verify_logged_in
        @city = City.find_by_id(params[:id])
        erb :'reviews/edit_review'
# Edit permission?
end

delete '/cities/:id/delete' do
    verify_logged_in
        city = City.find_by_id(params[:id])
          city.delete

        # put some kind of check for mad deleting
end

end