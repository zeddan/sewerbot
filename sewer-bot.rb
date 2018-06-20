require 'dotenv'
Dotenv.load

require 'slack-ruby-bot'
require_relative 'commands/foo'

module SewerBot
  class Bot < SlackRubyBot::Bot
  end
end

SewerBot::Bot.run
