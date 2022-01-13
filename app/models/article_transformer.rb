class ArticleTransformer
  def self.run(legacy_article_id)
    new(legacy_article_id).run
  end

  def initialize(legacy_article_id)
    @legacy_article_id = legacy_article_id
  end

  def run
    article = Article.create(article_attrs)
    legacy_article.update(transformed_at: Time.now, article_id: article.id)
  end

  private

  def legacy_article
    @legacy_article ||= LegacyArticle.find(@legacy_article_id)
  end

  def article_data
    legacy_article.data
  end

  def article_attrs
    {
      created_at: article_data["updated_at"]["$date"],
      legacy_article_id: legacy_article.id,
      published_at: article_data["published_at"]["$date"],
      title: article_data["title"],
      updated_at: article_data["updated_at"]["$date"],
    }
  end
end

