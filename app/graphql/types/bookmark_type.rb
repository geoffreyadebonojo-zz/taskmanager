Types::BookmarkType = GraphQL::ObjectType.define do
  name "Bookmark"
  
  field :id, !types.ID
  field :name, !types.String
  field :url, !types.String
end