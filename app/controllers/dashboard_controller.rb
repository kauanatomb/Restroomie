class DashboardController < ApplicationController
  def index
    skip_authorization
    @user = current_user
    @bookmarks = @user.bookmarks
    @restrooms = @user.restrooms
    @reviews = @user.reviews.includes(:restroom)
  end
end
