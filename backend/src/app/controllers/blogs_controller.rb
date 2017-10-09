class BlogsController < ApplicationController
  before_action :authenticate, only: [:new, :create]

  def index
    @articles = Article.all
  rescue => e
    render file: 'public/500'
  end

  def show
    @article = Article.find(params[:id])
    @article.view += 1
    @article.save!
  rescue => e
    render file: 'public/500'
  end

  def new

  end

  def create
    user = current_user
    article = user.articles.create!(article_params)
    redirect_to blogs_path
  rescue ActiveRecord::RecordNotSaved => e
    redirect_to new_blog_path
  rescue => e
    render file: 'public/500'
  end

  def destroy
    user = current_user
    article = user.articles.find params[:id]
    article.destroy!
    redirect_to blogs_path
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404'
  rescue ActiveRecord::RecordNotDestroyed
    render file: 'public/500'
  rescue
    render file: 'public/500'
  end

  private
  def article_params
    params.require(:article).permit(:thumbnail, :title, :chapeau, :content)
  end
end
