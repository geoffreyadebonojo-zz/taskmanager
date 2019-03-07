Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allTopics do
    type types[Types::TopicType]
    description "A list of all the Topics"

    resolve -> (obj, args, ctx) {
      Topic.all
    }
  end

  field :topic do
    type Types::TopicType
    description "Return a Topic"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Topic.find(args[:id]) }
  end
end
