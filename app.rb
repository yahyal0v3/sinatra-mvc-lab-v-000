require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @phrase = PigLatinizer.new
    @phrase.string = params[:text].to_s
    erb :form_output
  end
end
