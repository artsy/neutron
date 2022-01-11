class ArticlesController < ApplicationController
  expose(:article)
  expose(:articles) { Article.all }
end
