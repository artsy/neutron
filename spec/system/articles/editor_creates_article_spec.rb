require 'rails_helper'

describe "create article" do
  it "makes the article" do
    visit "/articles/new"

    expect(page).to have_content "New Article"

    fill_in "article[title]", with: "Brand New Article"
    click_button "create"

    expect(page).to have_current_path /edit/

    expect(Article.count).to eq 1
    article = Article.first

    expect(page).to have_content "Article #{article.id}"
    expect(page).to have_field "article[title]", with: article.title
  end
end
