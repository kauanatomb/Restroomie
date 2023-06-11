class RestroomsController < ApplicationController
  before_action :set_restroom, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restrooms = policy_scope(Restroom)
    @reviews = Review.where(restroom_id: @restroom)
    @markers = @restrooms.geocoded.map do |restroom|
    {
      lat: restroom.latitude,
      lng: restroom.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {restroom: restroom}),
      marker_html: render_to_string(partial: "marker", locals: { restroomLngLat: [restroom.longitude, restroom.latitude] })
    }
    end
  end


  def show
    authorize @restroom
    @bookmark = Bookmark.find_by(user: current_user, restroom: @restroom)
    # @review = Review.new(user: current_user, restroom: @restroom)
    @review = Review.new
  end


  def new
    @restroom = Restroom.new
    authorize @restroom
  end


  def create
    @restroom = Restroom.new(restroom_params)
    @restroom.user = current_user
    if @restroom.save
      redirect_to @restroom, notice: 'Restroom was successfully created.'
    else
      render :index
    end
    authorize @restroom
  end


  def bookmark
    @restroom = Restroom.find(params[:restroom_id])
    authorize @restroom
    @bookmark = Bookmark.find_by(user: current_user, restroom: @restroom)
    if @bookmark
       @bookmark.destroy
    else
       Bookmark.create(restroom: @restroom, user: current_user)
     end
     redirect_to restroom_path(@restroom)
  end

  def destroy
    @restroom.destroy
    authorize @restroom
    redirect_to restrooms_path
    # redirect to admin dashboard (in future)
    # notice/alert that the restroom was deleted
  end

  def edit
    authorize @restroom
  end

  def update
    if @restroom.update(restroom_params)
      redirect_to restroom_path(@restroom), notice: 'Restroom was successfully updated.'
    else
      render :edit
    end
    authorize @restroom
  end

  private

  def set_restroom
    @restroom = Restroom.find(params[:id])
  end

  def restroom_params
    params.require(:restroom).permit(:name, :address, :accessibility, :closing_time, :baby_friendly, :pricing, :opening_time, photo: [])
  end
end
