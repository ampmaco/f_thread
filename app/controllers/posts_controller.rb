class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to root_path
	end
	
	def index
		@q = Post.ransack(params[:q])
		@posts = @q.result
	end
	
	def show
		@post = Post.find(params[:id])
		@message = Message.new
	end

	private
	
	def post_params
		params.require(:post).permit(:title, :body, category_ids: [])
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys: [:email])
	end
end
