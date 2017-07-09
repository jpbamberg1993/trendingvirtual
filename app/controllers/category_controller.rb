class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 10)
    @articles = @articles.order('created_at DESC')
  end
end
