class BlogPostsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required, :except => [:index, :show]
	before_filter(:except => [:index, :show]) { access_required(:blog_editing) }

	# GET /blog_posts
	# GET /blog_posts.json
	def index
		@blog_posts = BlogPost.all
	end

	# GET /blog_posts/1
	# GET /blog_posts/1.json
	def show
	end

	# GET /blog_posts/new
	# GET /blog_posts/new.json
	def new
		@blog_post = BlogPost.new
	end

	# GET /blog_posts/1/edit
	def edit
	end

	# POST /blog_posts
	# POST /blog_posts.json
	def create
		@blog_post = BlogPost.new(blog_post_params.merge({ :user_id => current_user.id }))

		if @blog_post.save
			redirect_to @blog_post, notice: 'Blog post was successfully created.'
		else
			render action: "new"
		end
	end

	# PUT /blog_posts/1
	# PUT /blog_posts/1.json
	def update
		if @blog_post.update(blog_post_params)
			redirect_to @blog_post, notice: 'Blog post was successfully updated.'
		else
			render action: "edit"
		end
	end

	# DELETE /blog_posts/1
	# DELETE /blog_posts/1.json
	def destroy
		@blog_post.destroy

		redirect_to blog_posts_url
	end

	private

	def setup_environment
		@blog_post = BlogPost.find(params[:id])
	end

	def blog_post_params
		params.require(:blog_post).permit(:content,:title,:user_id)
	end
end
