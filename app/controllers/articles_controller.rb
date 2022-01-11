class ArticlesController < ApplicationController
  expose(:article)
  expose(:articles) { Article.order(created_at: :desc).limit(20) }

  def create
    if article.save
      redirect_to edit_article_path(article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
