class RestroomsController < ApplicationController
  before_action :set_restroom, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
      @restrooms = policy_scope(Restroom)
      @markers = @flats.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
  end

  def show
      authorize @restroom
  end

  def new
      @restroom = Restroom.new
      authorize @restroom
  end

  def create
      @restroom = Restroom.new(restroom_params)
      @restroom.user = current_user
      authorize @restroom
  end

  def destroy
      @restroom.destroy
      authorize @restroom
      redirect_to restrooms_path
      # redirect to admin dashboard (in future)
      # notice/alert that the restroom was deleted
  end

  private

  def set_restroom
      @restroom = Restroom.find(params[:id])
  end

  def restroom_params
      params.require(:restroom).permit(:name, :address, :accessibility, :hygiene_products, :baby_friendly, :pricing, :cleanliness, :photo)
  end
end
