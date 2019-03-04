class Video < ApplicationRecord
  belongs_to :topic

  def watch_link
    "https://youtube.com/watch?v=#{self.uri.split("/embed/").last}"
  end

  def search_term_name
    if self.search_term == ""
      self.search_term = self.topic.name
    else
      self.search_term
    end
  end

  def notes
    Note.where(video_id: self.id)
  end
end
