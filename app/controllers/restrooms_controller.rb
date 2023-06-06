class RestroomsController < ApplicationController
    def index
        @restrooms = Restroom.all
    end
end