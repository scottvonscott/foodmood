class ReviewController < ApplicationController

    def verify_logged_in
        if logged_in?
        else
            redirect to "/login"
        end
    end

get '/reviews' do
    verify_logged_in
    @reviews = Review.all 
    erb :'reviews/index'
end

post '/reviews' do
    verify_logged_in
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
  end

get '/reviews/new' do
    verify_logged_in
        erb :'reviews/new'
end

get '/reviews/:id' do
    verify_logged_in
        @review = Review.find_by_id(params[:id])
        erb :'review/show_review'
end

post '/reviews/:id' do
    verify_logged_in
    
end

get '/reviews/:id/edit' do
    verify_logged_in
        @review = Review.find_by_id(params[:id])
      if @review && @review.user == current_user
        erb :'tweets/edit_review'
      else
        redirect to '/reviews'
      end
end

patch '/reviews/:id/' do
    verify_logged_in
        if params[:content] == ""
            redirect to "/tweets/#{params[:id]}/edit"
          else
            @tweet = Tweet.find_by_id(params[:id])
            if @tweet && @tweet.user == current_user
              if @tweet.update(content: params[:content])
                redirect to "/tweets/#{@tweet.id}"
              else
                redirect to "/tweets/#{@tweet.id}/edit"
              end
            else
              redirect to '/tweets'
            end
          end
      end

delete '/reviews/:id/delete' do
    verify_logged_in
        @review = Review.find_by_id(params[:id])
        if @review && @review.user == current_user
          @review.delete
        end
        redirect to '/tweets'
end

end