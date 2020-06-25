class ReviewController < ApplicationController

get '/reviews' do
    if logged_in?
    @reviews = Review.all 
    erb :'reviews/index'
    else
      redirect to '/login'
    end
end

post '/reviews' do
    if logged_in?
      if params[:content] == ""
        redirect to "/reviews/new"
      else
        @review = current_user.reviews.build(title: params[:title])
        if @review.save
          redirect to "/reviews/#{@review.id}"
        else
          redirect to "/reviews/new"
        end
      end
    else
      redirect to '/login'
    end
  end

get '/reviews/new' do
    if logged_in?
        erb :'reviews/new'
    else
      redirect to '/login'
    end
    
end

get '/reviews/:id' do
    if logged_in?
        @review = Review.find_by_id(params[:id])
        erb :'review/show_review'
    else
      redirect to '/login'
    end
end

post '/reviews/:id' do
    if logged_in?
    else
      redirect to '/login'
    end
end

get '/reviews/:id/edit' do
    if logged_in?
    else
      redirect to '/login'
    end
end

patch '/reviews/:id/' do
    if logged_in?
    else
      redirect to '/login'
    end
end

delete '/reviews/:id/delete' do
    if logged_in?
    else
      redirect to '/login'
    end
end

end