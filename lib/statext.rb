require 'sinatra/base'

class Statext < Sinatra::Application
  set :sessions, true
  set :foo, 'bar'

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
