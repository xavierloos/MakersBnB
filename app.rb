require "sinatra/base"
require 'sinatra/flash'
require "./lib/user"
require "pg"

require_relative "./lib/listing.rb"

class AbodenB < Sinatra::Base

  enable :session
  register Sinatra::Flash

  get "/" do
    "Welcome"
  end

  get "/signup" do
    erb :signup
  end
  post "/signup" do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect "/profile"
  end
  get "/profile" do
    erb :profile
  end
  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.authentificate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect "/profile"
    else
      flash[:login_error] = "Please check your email or password"
    end
  end

  get "/listings/new" do
    erb :listings_new
  end

  post "/listings/new" do
    @title = params["title"]
    Listing.create(@title)
    redirect "/listings"
  end

  get "/listings" do
    erb :listings
  end
end
