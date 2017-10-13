require 'slack-ruby-client'
require 'slack-ruby-bot'
require './scraper'
require 'json'

class Bot < SlackRubyBot::Bot

  command 'foo' do |client, data, match|
    s = Scraper.new()
    s.scrape
    s.compare_old
    s.compare_new
    arr = s.get_new
    client.say(text: arr.to_json, channel: data.channel)
  end

end

Bot.run
