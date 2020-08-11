class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @newTopic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to topics_index_path
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
  end

  def new
    @newpost = Post.new(:topic_id => params[:id])
    @topics = Topic.all
    @newTopic = Topic.new
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title).merge(user_id: current_user.id)
  end

end
