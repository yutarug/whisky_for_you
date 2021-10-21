class Public::BottlesController < ApplicationController
    def index
    end
    def show
        @bottle=Bottle.find(params[:id])
    end
end
