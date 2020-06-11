class CategoriesController < ApplicationController

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to categories_path
	end
	def index
		@category = Category.new
		@categories = Category.all
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to categories_path
	end

	private
	def category_params
		params.require(:category).permit(:category_name)
	end
end
