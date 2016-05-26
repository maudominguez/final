class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.rating = params[:review][:rating]
    @review.comment = params[:review][:comment]
    @review.book_id = params[:review][:book_id]
    @review.user_id = params[:review][:user_id]
    if @review.save
      redirect_to book_url(@review.book_id), notice: "Review added! Thanks!"
    else
      redirect_to book_url(@review.book_id), notice: "Something went wrong!"
    end
  end

end
