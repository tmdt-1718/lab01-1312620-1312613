class BlogsController < ApplicationController
  def index
    @articles = Article.all
  rescue => e
    render file: 'public/500'
  end

  def show
    @article = Article.find(params[:id])
  rescue => e
    render file: 'public/500'
  end
end
