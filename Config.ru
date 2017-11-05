$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require_relative 'sewer-bot'
require_relative 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SewerBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SewerBot::Web
