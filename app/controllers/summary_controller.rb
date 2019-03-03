class SummaryController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @videos = @topic.videos.all
    @bookmarks = @topic.bookmarks.all
    @notes = @topic.notes.all
  end

  def create
    topic = Topic.find(params[:topic_id])
    SummaryMailer.send_summary(topic).deliver_now
    flash[:notice] = "Email Sent"
    binding.pry
    redirect_to "/"
  end
end
