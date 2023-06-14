class ReviewsController < ApplicationController
  before_action :set_review, except: [:create, :new, :index, :dashboard_reviews]
  before_action :authenticate_user!

  def index
    @reviews = policy_scope(Review)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @restroom = Restroom.find(params[:restroom_id])
    @review.restroom = @restroom
    @review.user = current_user
    authorize @review
    if @review.save
      authorize @restroom 
      redirect_to restroom_path(@restroom)
    else
      render 'bookmarks/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy = current_user
    authorize @restroom 
    redirect_to restroom_path(@restroom)
  end

  def dashboard_reviews
    skip_authorization
    @reviews = current_user.reviews
  end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
