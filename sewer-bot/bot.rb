module SewerBot
  class Bot < SlackRubyBot::Bot
		command 'foo' do |client, data, match|
			#s = Scraper.new()
			#s.scrape
			#s.compare_old
			#s.compare_new
			#arr = s.get_new
			arr = "hey"
			client.say(text: arr.to_json, channel: data.channel)
		end
  end
end
