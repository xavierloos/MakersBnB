require "sinatra/base"
require "./lib/user"
require "pg"

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
  end
end
