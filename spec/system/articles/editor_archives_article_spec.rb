require 'rails_helper'

describe "archive article" do
  let(:article) { FactoryBot.create(:article) }

  it "makes the article go away" do
    visit "/articles/#{article.id}/edit"

    click_button "archive"

    expect(page).to have_current_path "/articles"
    expect(page).to have_no_content article.title
  end
end
