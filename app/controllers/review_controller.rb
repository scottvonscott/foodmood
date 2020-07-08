class ReviewController < ApplicationController

    
  get '/reviews' do
      verify_logged_in
      @reviews = Review.all 
      erb :'reviews/index'
  end

  post '/reviews' do
      verify_logged_in
        if params.include?("cuisine") && params[:description] != ""
            cuisine = Cuisine.find_by(name: params[:cuisine])
            city = City.find_or_create_by(name: params[:city])
            restaurant = Restaurant.find_or_create_by(name: params[:restaurant], city: city, cuisine: cuisine)
            review = current_user.reviews.build(title: params[:title], description: params[:description], restaurant: restaurant)
            if review.save
              redirect to "/reviews/#{review.id}"
            else
              redirect to "/reviews/new"
            end
          else
            redirect to "/reviews/new"
        end
    end

  get '/reviews/new' do
      verify_logged_in
      @cuisines = Cuisine.all_sorted
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
        redirect to '/users/user_error'
      end
  end

  patch '/reviews/:id' do
      verify_logged_in
      if params[:description] == ""
          redirect to "/reviews/#{params[:id]}/edit"
        else
          review = Review.find_by_id(params[:id])
          if review && review.user == current_user
            if review.update(description: params[:description], title: params[:title])
              redirect to "/reviews/#{review.id}"
            else
              redirect to "/reviews/#{review.id}/edit"
            end
          else
            redirect to '/reviews'
          end
        end
  end

  get '/reviews/:id/delete_confirm' do
    verify_logged_in
    @review = Review.find(params[:id])
    if @review && @review.user == current_user
      erb :'reviews/delete_review'
    else
      redirect to '/users/user_error'
    end
  end

  delete '/reviews/:id/delete' do
      verify_logged_in
      review = Review.find(params[:id])
      if review && review.user == current_user
        review.delete
        redirect to '/reviews'
      else
        redirect to '/users/user_error'
      end
  end

end