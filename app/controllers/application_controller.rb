require "./config/environment"
require "./app/models/tweet"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public, "public"
    set :views, "app/views"
  end
  
  get "/" do
    @tweets = Tweet.all
    erb :index
  end
  

  
  post '/new_tweet' do
    @tweet = Tweet.new({:username => params[:username], :message => params[:message]})
    @tweet.save
    redirect to "/"
  end
  
  
  
end