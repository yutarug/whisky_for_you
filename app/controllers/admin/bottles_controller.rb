class Admin::BottlesController < ApplicationController

    def index
    end

    def new
        # @new_bottle_tag=BottleTag.new

        @areas=Area.all
        @new_bottle=Bottle.new
        # @new_tag=@new_bottle.tags.new
    end

    def create
        @new_bottle=Bottle.new(bottle_params)
        @new_bottle.area_id=params[:select_area][:id]
        @new_bottle.save
        tag_list= params[:bottle][:tag_names].split(",")
        @new_bottle.tags_save(tag_list)
        redirect_to admin_bottles_path
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def bottle_params
        params.require(:bottle).permit(:bottle_name,:address, :alcohol_content, :age,:feature,:introduction)
    end

end
