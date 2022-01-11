class ArticlesController < ApplicationController
  expose(:articles) { Article.all }
end
