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

        @new_taste=Taste.new(taste_params)
        @new_taste.bottle_id=@new_bottle.id
        @new_taste.save

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
        params.require(:bottle).permit(:bottle_name,:japanese_bottle_name,:image, :alcohol_content, :age,:feature,:introduction,:price_level)
    end

    def taste_params
        params.require(:bottle).permit(:peaty,:fruity, :floral, :feinty, :sulphury, :woody, :winey, :cereal)
    end
end
