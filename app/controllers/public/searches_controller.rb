class Public::SearchesController < ApplicationController
    def search
        @search_tag=Tag.all
    end
    def index
        # if params[:japanese_bottle_name].nil?
        # @tag=Tag.find(params[:tag_id])
        # @bottles=@tag.bottles
        # else
        @bottles=Bottle.search(params[:japanese_bottle_name])
        # end
    end
end
