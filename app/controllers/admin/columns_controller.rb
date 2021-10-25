class Admin::ColumnsController < ApplicationController
	def new
		@bottles=Bottle.all
		@new_column=Column.new
	end
	def create
		@column=Column.new(column_params)
		@column.save
		Bottle.find(params[:select_bottle][:id].to_i).update(column_id:@column.id)
		byebug
	end

	private
    def column_params
        params.require(:column).permit(:title,:introduction,:image)
    end
end
