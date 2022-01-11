module Types
  class ArticleEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(Types::ArticleType)
  end

  class ArticleConnectionType < GraphQL::PageCursorConnection
    edge_type(Types::ArticleEdgeType)
  end
end
