require "sinatra/base"
require_relative "./lib/listing.rb"

class AbodenB < Sinatra::Base
  get "/" do
    "Welcome"
  end

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
