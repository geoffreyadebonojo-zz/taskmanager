class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @topic = Topic.find(params[:topic_id])
    @videos = current_user.topics.find(params[:topic_id]).videos.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @notes = @video.notes
  end

  # GET /videos/new
  def new
    @video = Video.new
    @topic = Topic.find(params[:topic_id])
    if params[:search]
      @youtube_videos = YoutubeService.new(params[:search]).embed_links.uniq
    else
      @youtube_videos = YoutubeService.new(@topic.name).embed_links.uniq
    end
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to topic_videos_url, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to topic_videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = current_user.topics.find(params[:topic_id]).videos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:videos).permit(:uri, :topic_id, :search_term)
    end
end
