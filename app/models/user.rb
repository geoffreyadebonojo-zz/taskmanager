class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates :email, presence: true, uniqueness: true

  has_many :topics, dependent: :delete_all
end
