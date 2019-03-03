class SummaryMailer < ApplicationMailer
  def send_summary(topic)
    @topic = topic
    @videos = @topic.videos.all
    @bookmarks = @topic.bookmarks.all
    @notes = @topic.notes.all
    mail(to: "geoffrey.adebonojo@gmail.com", subject: "#{@topic.name} notes")
  end
end
