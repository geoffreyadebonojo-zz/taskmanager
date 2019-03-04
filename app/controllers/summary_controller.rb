class SummaryController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @videos = @topic.videos.all
    @bookmarks = @topic.bookmarks.all
    @notes = @topic.notes.all

    @misc_notes = @notes.misc
  end

  def create
    topic = Topic.find(params[:topic_id])
    email = current_user.email
    SummaryMailer.send_summary(email, topic).deliver_now
    flash[:notice] = "Email Sent"
    redirect_to "/profile"
  end
end
