class SummaryMailer < ApplicationMailer
  def send_summary(email, topic)
    @email = email
    @topic = topic
    @videos = @topic.videos.all
    @bookmarks = @topic.bookmarks.all
    @notes = @topic.notes.all
    mail(to: @email, subject: "#{@topic.name} notes")
  end
end
