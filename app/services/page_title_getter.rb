class PageTitleGetter
attr_reader :title

  def initialize(url)
    @agent       = Mechanize.new
    @agent.get(url)
    @title = @agent.page.title
  end

end
