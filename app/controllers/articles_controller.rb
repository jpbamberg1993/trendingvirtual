class ArticlesController < ApplicationController
  def index
    if params[:search]
      @searched = true
      @articles = Article.search(params[:search]).order('created_at DESC')
      @articles = @articles.paginate(page: params[:page], per_page: 10)
    else
      @articles = Article.paginate(page: params[:page], per_page: 10)
      @articles = @articles.order('created_at DESC')
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,
                                    :text,
                                    :author,
                                    :subject,
                                    :category_id)
  end
end
