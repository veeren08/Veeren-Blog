class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @article.like = @article.like + 1
    @article.save
  end

  def new
    @article = Article.new
  end

  def like
    @article = Article.find(params[:id])
    @article.like = @article.like + 1
    @article.save
  end

  def create
    @article = Article.new(article_params)
    @article.like = 0
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end



  # flash[:error] = "Cannot leave '#{Inflector.humanize(key)}' blank"

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def aboutus
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
