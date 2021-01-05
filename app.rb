require "sinatra/base"

require "./lib/user"
require "pg"

require_relative "./lib/listing.rb"

class AbodenB < Sinatra::Base
  enable :session
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
    # pg = PG.connect(dbname: "abodenb")
    # result = pg.exec("SELECT * FROM users WHERE email = '#{params[:email]}'")
    # user = User.new(
    #   id: result[0]["id"],
    #   username: result[0]["username"],
    #   email: result[0]["email"],
    #   password: result[0]["password"],
    # )
    user = User.authentificate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/profile"
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
