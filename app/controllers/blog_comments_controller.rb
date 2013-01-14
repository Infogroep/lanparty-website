class BlogCommentsController < ApplicationController
  before_filter :login_required
  before_filter(:only => [:edit, :update, :destroy]) { BlogComment.find(params[:id]).user_id == self.current_user.id || access_required(:blog_editing) }

  # GET /blog_comments/1/edit
  def edit
    @blog_comment = BlogComment.find(params[:id])
  end

  # POST /blog_comments
  # POST /blog_comments.json
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_comment = @blog_post.blog_comments.create(params[:blog_comment].merge({:user_id => self.current_user.id}))
    redirect_to blog_post_path(@blog_post)
  end

  # PUT /blog_comments/1
  # PUT /blog_comments/1.json
  def update
    @blog_comment = BlogComment.find(params[:id])

    respond_to do |format|
      if @blog_comment.update_attributes(params[:blog_comment])
        format.html { redirect_to @blog_comment, notice: 'Blog comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_comments/1
  # DELETE /blog_comments/1.json
  def destroy
    @blog_comment = BlogComment.find(params[:id])
    @blog_comment.destroy

    respond_to do |format|
      format.html { redirect_to blog_comments_url }
      format.json { head :no_content }
    end
  end
end
