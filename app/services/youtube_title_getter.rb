class YoutubeTitleGetter
attr_reader :title

  def initialize(embed_url)
    @uri = embed_url.split("embed/").last
    @watch_url = "https://www.youtube.com/watch?v=#{@uri}"
    @agent       = Mechanize.new
    @agent.get(@watch_url)
    @title = @agent.page.title.split("-").first
  end

end
