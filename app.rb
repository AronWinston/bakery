require "sinatra"
require "sendgrid-ruby"
require_relative "./class"






get "/" do

    erb :index
end

get "/cookies" do

    @chocolate_chip = Cookie.new("Delicious and moist", "$5.99/dz")
    @rainbow_cookie = Cookie.new("Bright and colorfull", "$4.99/dz")

    erb :cookies
end

get "/cakes" do

    @space_cake = Cake.new("Hunky Chuncky Choco", "$12.99/cake")
    @cheese_cake = Cake.new("Baked with premium cheese", "$15.99/cake")
    erb :cakes
end

get "/muffins" do

    @corn_muffin = Muffin.new("This muffin is corny", "$.99/muffin")
    @blueberry_muffin = Muffin.new("Flavorfull and fantastic", "$1.99/muffin")
    erb :muffins
end