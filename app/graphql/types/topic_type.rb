Types::TopicType = GraphQL::ObjectType.define do
  name "Topic"
  
  field :id, !types.ID
  field :name, !types.String
end