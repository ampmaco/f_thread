class CategoriesController < ApplicationController
	before_action :authenticate_user!
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

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys: [:email])
	end
end
