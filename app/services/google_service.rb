class GoogleService
  attr_accessor :page, :links

  def initialize(search_term)
    @search_term = search_term.gsub(/[ ]/, '+')
    @base        = "https://www.google.com/"
    @agent       = Mechanize.new
    @agent.get(@base)
    @page
    @links = submit_search
  end

  def submit_search
    @page = @agent.page
    @page.forms.first.fields[-2].value = @search_term
    @page.forms.first.submit
    @page = @agent.page

    mech_links = @page.links.find_all {|x| x.uri.to_s.include?("search")}

    page_links = Hash.new("")

    mech_links.map do |x|
      page_links[x.text] = x.uri.to_s
    end
    page_links

  end

  def page(n)
    x = @agent.get("https://www.google.com" + @links[n.to_s])
    relevant_links = x.links.find_all do |y|
      y.uri.to_s.include?("url") &&
      !y.uri.to_s.include?("www.google.com/aclk") &&
      !y.uri.to_s.include?("www.youtube.com") &&
      !y.uri.to_s.include?("settings/ads/") &&
      !y.text.include?("Cached")
    end
    relevant_links.map do |x|
      [x.text, x.uri.to_s.split("/url?q=").last.split("?sa=").first.split("&sa=").first]
    end
  end

  def load_pages

    all_results = []
    first_page = @page.links.find_all {|x|
      x.uri.to_s.include?("/url?q=")
      !x.uri.to_s.include?("webcache") &&
      !x.uri.to_s.include?("search?") &&
      !x.uri.to_s.include?("support/websearch") &&
      !x.uri.to_s.include?("tools/feedback/survey") &&
      !x.uri.to_s.include?("intl/en/") &&
      !x.uri.to_s.include?("/services") &&
      !x.uri.to_s.include?("account") &&
      # !x.uri.to_s.include?("www.google.com/aclk") &&
      !x.uri.to_s.include?("?hl=en") &&
      !x.uri.to_s.include?("google.com") &&
      !x.uri.to_s.include?("www.youtube.com") &&
      !x.uri.to_s.include?("settings/ads/") &&
      !x.text.to_s.include?("Google Home")
    }

    first_page.each {|x| all_results << [x.text, x.uri.to_s.split("/url?q=").last.split("?sa=").first.split("&sa=").first]}

    (2..5).each do |i|
      page(i).each do |link|
        all_results << link
      end
      # sleep(rand(1..3))
    end
    all_results
  end

end
