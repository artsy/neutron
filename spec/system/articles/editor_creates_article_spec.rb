require 'rails_helper'

describe "create article" do
  it "makes the article" do
    visit "/articles/new"

    expect(page).to have_content "New Article"

    fill_in "article[title]", with: "Brand New Article"
    click_button "create"
    # this retries and that lets the POST complete
    expect(page).to have_no_content "New Article"

    expect(Article.count).to eq 1
    article = Article.first

    expect(page.current_path).to eq "/articles/#{article.id}/edit"
    expect(page).to have_content "Article #{article.id}"
    expect(page).to have_field "title", with: article.title
  end
end
