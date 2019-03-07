Types::TopicType = GraphQL::ObjectType.define do
  name "Topic"
  
  field :id, !types.ID
  field :name, !types.String
  field :children, types[Types::TopicType]
  field :ancestors, types[Types::TopicType]
  field :videos, types[Types::VideoType]
  field :bookmarks, types[Types::BookmarkType]
end