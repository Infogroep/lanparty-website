class BlogCommentsController < ApplicationController
	before_filter :login_required
	before_filter(:only => [:edit, :update, :destroy]) { true_required (BlogComment.find(params[:id]).user_id == current_user.id || current_user.access_allowed?(:blog_editing)) }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	# GET /blog_comments/1/edit
	def edit
		@blog_comment = BlogComment.find(params[:id])
	end

	# POST /blog_comments
	# POST /blog_comments.json
	def create
		@blog_post = BlogPost.find(params[:blog_post_id])
		@blog_comment = @blog_post.blog_comments.create(blog_comment_params.merge({ :user_id => current_user.id }))
		redirect_to @blog_post
	end

	# PUT /blog_comments/1
	# PUT /blog_comments/1.json
	def update
		if @blog_comment.update(blog_comment_params)
			redirect_to @blog_post, flash: { info: 'Blog comment was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /blog_comments/1
	# DELETE /blog_comments/1.json
	def destroy
		@blog_comment.destroy

		redirect_to @blog_post
	end

	private

	def setup_environment
		@blog_post = BlogPost.find(params[:blog_post_id])
		@blog_comment = BlogComment.find(params[:id])
	end

	def blog_comment_params
		params.require(:blog_comment).permit(:content, :blog_post_id, :user_id)
	end
end
