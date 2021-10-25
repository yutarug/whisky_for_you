class Public::BottlesController < ApplicationController
    def index
        @bottles=Bottle.all
    end
    def show
        @bottle=Bottle.find(params[:id])
        @bottles=@bottle.recommendations
    end
end
