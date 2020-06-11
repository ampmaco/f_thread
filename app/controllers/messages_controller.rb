class MessagesController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		message = current_user.messages.new(message_params)
		message.post_id = post.id
		message.save
		redirect_to post_path(post)
	end

	def message_params
		params.require(:message).permit(:user_id, :post_id, :body)
	end
end
