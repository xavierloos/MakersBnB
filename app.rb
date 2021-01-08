require "sinatra/base"
require "sinatra/flash"
require "./lib/user"
require "./lib/booking"
require "pg"

require_relative "./lib/listing.rb"

class AbodenB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/" do
    "Welcome"
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect "/login"
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.authentificate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect "/profile/#{session[:user_id]}"
    else
      flash[:login_error] = "Please check your email or password"
      redirect "/login"
    end
  end

  post "/logout" do
    session.destroy
    redirect "/login"
  end

  get "/profile/:id" do
    check_login
    @user = User.find(id: session[:user_id])
    erb :profile
  end

  get "/listings/new" do
    check_login
    erb :listings_new
  end

  post "/listings/new" do
    new_listing = Listing.create(title: params["title"], description: params["description"], price: params["price"])
    redirect "/listings/availability/#{new_listing.id}"
  end

  get "/listings/availability/:id" do
    @listing = Listing.find(id: params[:id])
    erb :listings_availability
  end

  post "/listings/availability/:id" do
    @listing = Listing.find(id: params[:id])
    @listing.add_availability(date: params[:available_night])
    redirect "/listings/availability/#{@listing.id}"
  end

  get "/listings" do
    check_login
    @listings = Listing.all
    erb :listings
  end

  get "/booking" do
    erb(:booking)
  end

  get "/listings/view/:id" do
    @user = User.find(id: session[:user_id])
    @listing = Listing.find(id: params[:id])
    erb :listings_view
  end

  post "/listings/book/:id" do
    connection = connect_to_database
    p params[:date]
    date_id = connection.exec("SELECT id FROM dates WHERE date='#{params[:date]}';")
    connection.close
    Booking.create(date_id: date_id[0]['id'], listing_id: params[:listing_id], user_id: params[:id])
    redirect("/profile/#{session[:user_id]}")
  end

  def check_login
    redirect "/login" if session[:user_id] == nil #check if there is an user
  end
end
