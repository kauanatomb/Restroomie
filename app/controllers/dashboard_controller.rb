class DashboardController < ApplicationController
  def index
    skip_authorization
    @user = current_user
    @bookmarks = current_user.bookmarks
    @restrooms = current_user.restrooms
    @reviews = current_user.reviews
  end
end
