class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  # after_action :goto_article, only: [:create, :update] doesn't work :(
  def index
    @articles = Article.all
  end

  def show
    # @article = article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    # @article = article.find(params[:id])
  end

  def update
    # @article = article.find(params[:id])
    @article.update(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    # @article = article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  # def goto_article
  #   redirect_to article_path(@article)
  # end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
