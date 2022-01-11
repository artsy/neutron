require 'rails_helper'

describe 'articles query' do
  let(:query) { <<-GRAPHQL }
    query {
      articles(first:3) {
        edges {
          node {
            title
          }
        }
      }
    }
  GRAPHQL

  it 'returns those articles' do
    FactoryBot.create_list(:article, 3)
    post '/api/graphql', params: { query: query }
    expect(response.status).to eq 200
    edges = response_json.dig('data', 'articles', 'edges')
    expect(edges.count).to eq 3
  end
end
