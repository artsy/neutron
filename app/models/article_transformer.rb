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
    past_slugs.each do |slug|
      article.slugs.create(slug: slug)
    end
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
      created_at: updated_at,
      legacy_article_id: legacy_article.id,
      published_at: article_data.dig("published_at", "$date"),
      slug: current_slug,
      title: article_data["title"],
      updated_at: updated_at,
    }
  end

  def updated_at
    timestamp = article_data["updated_at"]

    return timestamp if timestamp.nil? || timestamp.is_a?(String)

    timestamp["$date"]
  end

  def current_slug
    article_data["slug"]
  end

  def past_slugs
    slugs = Array(article_data["slugs"])
    return slugs unless slugs.any?

    slugs - [current_slug]
  end
end
