class Api::V1::VideosController < ApplicationController

  def index
    # render json: VideoSerializer.new(Video.where(topic_id: params[:topic_id]))
  end

end
