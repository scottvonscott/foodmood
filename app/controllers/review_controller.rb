class ReviewController < ApplicationController

    
get '/reviews' do
    verify_logged_in
    @reviews = Review.all 
    erb :'reviews/index'
end

post '/reviews' do
    verify_logged_in
      if params[:description] == ""
        # put error here
        redirect to "/reviews/new"
      else
        city = City.find_or_create_by(name: params[:city])
        restaurant = Restaurant.find_or_create_by(name: params[:restaurant], city: city)
        review = current_user.reviews.build(title: params[:title], description: params[:description], restaurant: restaurant)
        if review.save
          redirect to "/reviews/#{review.id}"
        else
          # put error here
          redirect to "/reviews/new"
        end
      end
  end

get '/reviews/new' do
    verify_logged_in
        erb :'reviews/new'
end

get '/reviews/:id' do
    verify_logged_in
        @review = Review.find(params[:id])
        erb :'reviews/show_review'
end

get '/reviews/:id/edit' do
    verify_logged_in
        @review = Review.find(params[:id])
      if @review && @review.user == current_user
        erb :'reviews/edit_review'
      else
        # put error here
        redirect to '/reviews'
      end
end

patch '/reviews/:id' do
    verify_logged_in
        if params[:description] == ""
            redirect to "/reviews/#{params[:id]}/edit"
            # put error here
          else
            review = Review.find_by_id(params[:id])
            if review && review.user == current_user
              if review.update(description: params[:description])
                redirect to "/reviews/#{review.id}"
              else
                redirect to "/reviews/#{review.id}/edit"
                # put error here
              end
            else
              redirect to '/reviews'
              # put error here
            end
          end
      end

get '/reviews/:id/delete_confirm' do
  verify_logged_in
  @review = Review.find(params[:id])
  erb :'reviews/delete_review'
end

delete '/reviews/:id/delete' do
    verify_logged_in
        review = Review.find(params[:id])
        if review && review.user == current_user
          review.delete
        end
        redirect to '/reviews'
        # put error here
end

end