require "sinatra/base"

require "./lib/user"
require "pg"

require_relative "./lib/listing.rb"


class AbodenB < Sinatra::Base
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


  get "/listings/new" do
    erb :listings_new
  end

  post "/listings/new" do
    @title = params['title']
    Listing.create(@title)
    redirect "/listings"
  end

  get "/listings" do
    erb :listings

  end
end
