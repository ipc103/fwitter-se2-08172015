require "./config/environment"
require "./app/models/tweet"
require "./app/models/user"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public, "public"
    set :views, "app/views"
  end
  
  get "/" do
    @tweets = Tweet.all
    @users = User.all
    erb :index
  end
  
  post '/new_tweet' do
    @tweet = Tweet.new({:user_id => params[:user_id], :message => params[:message]})
    @tweet.save
    redirect to "/"
  end
  
  get '/users' do
    erb :users
  end
  
  
  
end