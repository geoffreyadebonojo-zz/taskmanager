class VideoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :uri, :search_term

  belongs_to :topic
end
