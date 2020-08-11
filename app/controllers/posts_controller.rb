class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post,only: [:show, :edit, :update, :destroy]
  before_action :force_redirect_uniless_my_post, only: [:edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    
  end

  def new
    @post = Post.new
    @newTopic = Topic.new
    @newpost = Post.new(:topic_id => params[:id])
  end

  def edit
  end

  def create
    @post = Post.new(params[:post].permit(:topic_id, :content))
    @post.user = current_user
    if @post.save
      redirect_to topics_show_path(params[:post]['topic_id']), notice: "投稿に成功しました"
    else
      render :edit
    end
  end

  def update
    if @post.update(post_params)
      redirect_to topics_show_path(params[:post]['topic_id']), notice: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to topics_show_path(params[:post]['topic_id']), notice: "投稿を削除しました"
    else
      redirect_to topics_show_path(params[:post]['topic_id']), alert: "投稿を削除できませんでした"
    end
  end

  private

  def post_params
    params.require(:post).permit(
        :content, images: []
        .merge(user_id: current_user.id)
    )
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def force_redirect_uniless_my_post
    return redirect_to root_path, alert: "自分の投稿ではありません" if @post.user != current_user
  end
end
