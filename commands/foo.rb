require 'json'
require 'pry'

require_relative '../scraper/scraper'

module SewerBot
  class Foo < SlackRubyBot::Commands::Base
    command 'foo'

    def self.call(client, data, match)
      scraper = Scraper.new()
      msg = message(scraper.run())
      client.say(text: msg, channel: data.channel)
    end

    private

    def self.message(events)
      msg = "Current events: \n"
      events.each do |e|
        msg << "\n*#{e[:title]}* on _#{e[:date]}_\n"
        msg << "Tags: #{e[:tags]}\n"
      end
      msg
    end
  end
end
