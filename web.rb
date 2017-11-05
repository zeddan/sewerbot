require 'sinatra/base'

module SewerBot
  class Web < Sinatra::Base
    get '/' do
      ':)'
    end
  end
end
