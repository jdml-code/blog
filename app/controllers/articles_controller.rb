class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :new, :create, :article_params, :from_author]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(title: params[:article][:title],
                                            body: params[:article][:body],
                                            status: params[:article][:status])
    redirect_to @article
    #Article.new(article_params)

  #   if @article.save
  #     redirect_to @article
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
