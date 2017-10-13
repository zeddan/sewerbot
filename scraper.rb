require 'metainspector'

class Scraper

  def initialize
    @old_events = []
    @new_events = []
    @scraped_events = []
  end

  def scrape
    page = MetaInspector.new("foocafe.org/malmoe")
    links = page.links.all

    @scraped_urls = links.select do |url|
      url.include? "http://foocafe.org/malmoe/events/1"
    end
    
    get_event_title
  end

  def get_event_title(url)
    page = MetaInspector.new(url)

    # https://api.slack.com/docs/message-formatting#linking_to_urls
    # <http://www.foo.com|www.foo.com>
    # parse meeee

  end

  def compare_old
    File.open("old_events.rb", "r") do |f|
      f.each_line do |line|
        @old_events.push line.chomp
      end
    end

    @scraped_urls.each do |scraped_url|
      if not @old_events.include? scraped_url
        @scraped_events.push scraped_url
      end
    end
  end

  def compare_new
    tmp_arr = []
    File.open("new_events.rb", "r") do |f|
      f.each_line do |line|
        @new_events.push line
      end
    end

    @scraped_events.each do |scraped_url|
      if not @new_events.include? scraped_url
        tmp_arr.push scraped_url
      end
    end

    File.open("new_events.rb", "w+") do |f|
      f.puts(tmp_arr);
    end
  end

  def get_new
    @a = []
    File.open("new_events.rb", "r") do |f|
      f.each_line do |line|
        @a.push line.chomp
      end
    end
    @a 
  end
end

# scrape()
# compare_old()
# compare_new()
