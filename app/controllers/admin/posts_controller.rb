class Admin::PostsController < Admin::BaseController
  def new
    @post = Post.new
  end

  def create
    user = current_user
    post = user.posts.new(post_params)
    if post.save
      flash[:notice] = 'Post was created succesfully'
      redirect_to post_path(post)
    else
      flash[:alert] = 'Post was not created'
      redirect_to new_admin_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:notice] = 'Post was updated succesfully'
      redirect_to post_path(post)
    else
      flash[:alert] = 'Post was not updated'
      redirect_to edit_admin_post_path(post)
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'Post was deleted succesfully'
    else
      flash[:alert] = 'Post was not deleted'
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
