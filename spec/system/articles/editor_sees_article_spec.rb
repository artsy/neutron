require 'rails_helper'

describe "article" do
  it "shows the article" do
    article = FactoryBot.create(:article)
    visit "/articles/#{article.id}/edit"
    expect(page).to have_content "Article #{article.id}"
    expect(page).to have_field "title", with: article.title
  end
end
