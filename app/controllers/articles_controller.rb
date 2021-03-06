class ArticlesController < ApplicationController

  before_filter :find_article, only: [:show, :edit, :update, :destroy]
  before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def index
      @articles = Article.all
    end

   def show
    #@article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
  @article = Article.new(article_params)
  if
  @article.save
  redirect_to @article
else
  render :new
end
end

def update
  #@article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  #@article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text, :photo)
  end

  def find_article
    @article = Article.where(id: params[:id]).first
    render_404 unless @article

    end

  end


