module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :article, ArticleType do
      description "An Article."
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end

    field :articles, ArticleConnectionType, connection: true do
      description "A Connection of Articles."
    end

    def articles
      Article.where(archived_at: nil)
    end
  end
end
