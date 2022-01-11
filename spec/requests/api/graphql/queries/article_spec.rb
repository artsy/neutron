require 'rails_helper'

describe 'article query' do
  let(:article) { FactoryBot.create :article }

  let(:query) { <<-GRAPHQL }
    query {
      article(id:#{article.id}) {
        title
      }
    }
  GRAPHQL

  it 'returns that article' do
    post '/api/graphql', params: { query: query }
    expect(response.status).to eq 200
    title = response_json.dig("data", "article", "title")
    expect(title).to eq article.title
  end
end
