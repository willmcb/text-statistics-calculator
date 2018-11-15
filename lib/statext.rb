require 'sinatra/base'
require_relative 'calculator_service'

class Statext < Sinatra::Application
  set :sessions, true
  set :foo, 'bar'

  get '/' do
    session.clear
    erb(:index)
  end

  get '/results' do
    @results = session[:results]
    @text = session[:text]
    erb(:results)
  end

  post '/' do
    session[:results] = CalculatorService.readability(params[:text])
    session[:text] = params[:text]
    redirect '/results'
  end

  run! if app_file == $0
end
