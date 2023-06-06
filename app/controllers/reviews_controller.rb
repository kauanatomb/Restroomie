class ReviewsController < ApplicationController
  before_action :set_review


  def new
      @review = Review.new
  end

  def show
      @review = Review.find(params[:id])
  end


  def create
      @review = Review.new(review_params)
      @review.user = current_user
      @review.save
      redirect_to review_path(@review)
  end


  def destroy
      @review.destroy = current_user
      redirect_to reviews_path
  end

private

  def set_review
      @review = Review.find(params[:id])
  end

  def review_params
      params.require(:review).permit(:rating, :comment)
  end

end
