class Bookmark < ApplicationRecord
  belongs_to :topic

  def notes
    Note.where(bookmark_id: self.id)
  end
end
