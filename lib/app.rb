require 'sinatra/base'

class App < Sinatra::Application
  set :sessions, true
  set :foo, 'bar'

  get '/' do
    'Hello world!'
  end
end