class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :delete_all
  has_many :videos, dependent: :delete_all
  has_many :notes, dependent: :delete_all

  def parent
    if self.parent_id
      Topic.find(self.parent_id)
    end
  end

  def child
    Topic.find_by(parent_id: self.id)
  end

  def increment
    ancestors = []
    ancestors << self
    until ancestors.last.parent_id == nil
      ancestors << recursion(ancestors.last)
    end
    ancestors
  end

  def recursion(topic)
    topic.parent
  end

end
