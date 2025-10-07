require 'bundler'
Bundler.require

require_relative 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    @all_gossips = Gossip.all
    erb :index
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    author = params['gossip_author']
    content = params['gossip_content']
    Gossip.new(author, content).save
    redirect'/'
  end
  get '/gossips/:id/' do
    gossip = Gossip.find(params[:id].to_i)
    erb :show, locals: { gossip: gossip }
  end
end