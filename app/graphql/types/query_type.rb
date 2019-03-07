Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allTopics do
    type types[Types::TopicType]
    description "A list of all the Topics"
    resolve -> (obj, args, ctx) { Topic.all }
  end

  field :topic do
    type Types::TopicType
    description "Return a Topic"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]) }
  end

  field :ancestors do
    type types[Types::TopicType]    
    description "Return a Topic's ancestors"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]).ancestors }
  end

  field :children do
    type types[Types::TopicType]
    description "Return a Topic's children"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]).children }
  end

  field :allVideos do
    type types[Types::VideoType]
    description "Return all Videos"
    resolve -> (obj, args, ctx) { Video.all }
  end

  field :videos do
    type types[Types::VideoType]
    description "Return a Topics Videos"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]).videos }
  end

  field :allBookmarks do
    type types[Types::BookmarkType]
    description "Return all Bookmarks"
    resolve -> (obj, args, ctx) { Bookmark.all }
  end

  field :bookmarks do
    type types[Types::BookmarkType]
    description "Return a Topics Bookmarks"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]).bookmarks }
  end
end
