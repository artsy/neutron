require 'rails_helper'

describe "articles" do
  context "with no articles" do
    it "renders an empty list" do
      visit "/articles"
      expect(page).to have_content "Recent Articles"
      expect(page).to have_css "ul"
      expect(page.all("li").count).to eq 0
    end
  end

  context "with 1 article" do
    it "lists that article by title with a link" do
      article = FactoryBot.create(:article)
      visit "/articles"

      expect(page.all("li").count).to eq 1
      expect(page).to have_link(article.title)
    end
  end

  context "with a few articles" do
    it "lists those articles" do
      articles = FactoryBot.create_list(:article, 3)
      visit "/articles"
      expect(page.all("li").count).to eq 3

      articles.each do |article|
        expect(page).to have_css("li", text: article.title)
      end
    end
  end

  context "with a bunch of articles" do
    it "only lists the most recent 20 articles" do
      recent_articles = FactoryBot.create_list(:article, 20)
      older_article = FactoryBot.create(:article, title: "Older Article", created_at: 1.week.ago)
      visit "/articles"
      expect(page.all("li").count).to eq 20
      expect(page).to have_no_content(older_article.title)
    end
  end
end
