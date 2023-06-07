class BookmarksController < ApplicationController
    before_action :set_bookmark, only: :destroy

    def destroy
        @bookmark.destroy
        redirect_to restrooms_path(@bookmark.restroom), status: :see_other
    end

    private
    def set_bookmark
        @bookmark = Bookmark.find(params[:id])
    end
end