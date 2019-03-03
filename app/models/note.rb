class Note < ApplicationRecord
  belongs_to :topic

  def bookmark
    Bookmark.find(self.bookmark_id) if self.bookmark_id
  end

  def video
    Video.find(self.video_id) if self.video_id
  end

  def self.misc
    Note.where(bookmark_id: nil).where(video_id: nil)
  end

end
