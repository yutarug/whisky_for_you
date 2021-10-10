class Admin::BottlesController < ApplicationController

    def index
    end

    def new
        @areas=Area.all
        @new_bottle=Bottle.new
        @new_tag=@new_bottle.tags.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

end
