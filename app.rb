require "sinatra"
require "sendgrid-ruby"
require_relative "./class"






get "/" do

    erb :index
end

get "/cookies" do

    @chocolate_chip = Cookie.new("Delicious and moist", "$5.99/dz")

    erb :cookies
end

get "/cakes" do

    @space_cake = Cake.new("Super strong", "$19.99/200 grams")
    erb :cakes
end

get "/muffins" do

    @corn_muffin = Muffin.new("This muffin is corny", "$.99/muffin")
    erb :muffins
end