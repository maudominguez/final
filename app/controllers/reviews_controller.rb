class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.rate = params[:review][:rate]
    @review.comment = params[:review][:comment]
    @review.book_id = params[:review][:book_id]
    @review.user_id = params[:review][:user_id]
    if @review.save
      redirect_to book_path(@review.book_id), notice: "Review added! Thanks!"
    else
      render books_path, notice: "Something went wrong!"
    end
  end

end
