require 'slack-ruby-client'
require './scraper'
require 'json'

class Bot
  # def initialize
  #   $API_KEY = "xoxb-256033069970-HqH6rkCM2xtk1IiEiolNiMyW"
  #   
  #   Slack.configure do |config|
  #     #config.token = ENV['SLACK_API_TOKEN']
  #     config.token = $API_KEY;
  #   end

  #   s = Scraper.new()
  #   s.scrape
  #   s.compare_old
  #   s.compare_new
  #   arr = s.get_new
  #   
  #   @client = Slack::Web::Client.new
  #   @client.auth_test
  #   @client.chat_postMessage(channel: '#dev', text: arr.to_json, as_user: true)
  # end

  def initialize
    client = Slack::RealTime::Client.new

    client.on :hello do
      puts "okasd"
    end

    client.start!
  end

end

bot = Bot.new
