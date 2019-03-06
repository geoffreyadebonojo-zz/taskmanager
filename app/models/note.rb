class Note < ApplicationRecord
  belongs_to :topic

  def bookmark
    Bookmark.find(self.bookmark_id) if self.bookmark_id
  end

  def video
    Video.find(self.video_id) if self.video_id
  end

  def self.misc
    Note.where(bookmark_id: "").where(video_id: "")
  end

  def links
    if self.body.include?("<") && self.body.include?(">")
      self.body.split("<").last.split(">").first
    end
  end

end
