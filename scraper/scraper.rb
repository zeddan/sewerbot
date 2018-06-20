require 'nokogiri'
require 'open-uri'

class Scraper

  def run 
    events = []
    doc = Nokogiri::HTML(open('http://foocafe.org/malmoe/events/'))
    boxes = doc.css(".foo-grid-box")
    boxes.each do |box|
      events.push({
        "title": box.css(".title").text,
        "tags": box.css(".tags").text,
        "date": box.css(".date").text,
        "img_url": 'http://foocafe.org' + box.css(".cover")[0]['src']
      }) 
    end
    events 
  end

  private

  def get_events(scraped_urls)
    path = File.join(Dir.pwd, "scraper", "events.txt")
    events = []
    File.open(path, "r") do |f|
      f.each_line do |line|
        events.push line.chomp
      end
    end

    scraped_urls.each do |scraped_url|
      if not @old_events.include? scraped_url
        @scraped_events.push scraped_url
      end
    end
  end

end
