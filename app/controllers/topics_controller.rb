class TopicsController < ApplicationController
  layout 'blog'
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    
    
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.all.order(updated_at: :desc).page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.where("status = 1").order(updated_at: :desc).page(params[:page]).per(5)
    end
    
  end
end


