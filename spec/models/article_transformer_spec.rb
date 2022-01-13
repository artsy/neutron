require 'rails_helper'

describe ArticleTransformer do
  describe ".run" do
    it "makes an article and updates the legacy article" do
      data = {
        "published_at" => { "$date" => "2012-08-21T19:27:23Z" },
        "title" => "Best article",
        "updated_at" => { "$date" => "2012-12-11T15:14:35Z" },
      }

      legacy_article = FactoryBot.create :legacy_article, data: data

      expect do
        ArticleTransformer.run(legacy_article.id)
      end.to change(Article, :count).by(1)

      legacy_article.reload

      expect(legacy_article).to be_transformed
      article = legacy_article.article

      expect(article.legacy_article).to eq legacy_article

      expect(article.created_at.iso8601).to eq legacy_article.data["updated_at"]["$date"]
      expect(article.published_at.iso8601).to eq legacy_article.data["published_at"]["$date"]
      expect(article.title).to eq legacy_article.data["title"]
      expect(article.updated_at.iso8601).to eq legacy_article.data["updated_at"]["$date"]
    end
  end
end
