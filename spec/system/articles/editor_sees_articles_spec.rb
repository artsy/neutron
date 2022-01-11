require 'rails_helper'

describe "articles" do
  it "lists articles" do
    articles = FactoryBot.create_list(:article, 3)
    visit "/articles"
    expect(page).to have_content "Articles"

    articles.each do |article|
      expect(page).to have_css("li", text: article.title)
    end
  end
end
