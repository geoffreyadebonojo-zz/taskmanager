class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :videos
  has_many :notes
end
