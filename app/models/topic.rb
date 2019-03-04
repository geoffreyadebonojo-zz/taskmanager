class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :delete_all
  has_many :videos, dependent: :delete_all
  has_many :notes, dependent: :delete_all
end
