class BlogsController < ApplicationController
  before_action :authenticate

  def index
    @articles = Article.all
  rescue => e
    render file: 'public/500'
  end

  def new

  end

  def create
    @user = current_user
    @article = @user.articles.create!(article_params)
    redirect_to blogs_path
  rescue ActiveRecord::RecordNotSaved => e
    redirect_to new_blog_path
  rescue => e
    render file: 'public/500'
  end

  def show
    @article = Article.find(params[:id])
  rescue => e
    render file: 'public/500'
  end

  private
  def article_params
    params.require(:article).permit(:thumbnail, :title, :chapeau, :content)
  end
end
