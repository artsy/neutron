require 'rails_helper'

describe "edit article" do
  let(:article) { FactoryBot.create(:article, title: "Initial title") }

  it "updates the article" do
    visit "/articles/#{article.id}/edit"

    expect(page).to have_field "article[title]", with: "Initial title"
    fill_in "article[title]", with: "Updated title"
    click_button "update"

    expect(page).to have_current_path "/articles"
    expect(page).to have_content "Updated title"
  end
end
