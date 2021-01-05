require "sinatra/base"
require "pg"
class AbodenB < Sinatra::Base
  get "/" do
    "Welcome"
  end
  get "/signup" do
    erb :signup
  end
  post "/signup" do
    redirect "/profile"
  end
  get "/profile" do
    erb :profile
  end
end
