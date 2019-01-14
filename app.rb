require "sinatra"
require "sendgrid-ruby"
require_relative "./class"






get "/" do

    erb :index
end

get "/cookies" do

    @chocolate_chip = Cookie.new("Delicious and moist", "$5.99/dz", "chocolate-chip", "https://bit.ly/1yuIoLY")
    @rainbow_cookie = Cookie.new("Bright and colorfull", "$4.99/dz", "macaron", "https://bit.ly/2AMjb9G" )
    @peanut_cookie = Cookie.new("Creamy peanut butter", "$6.99/dz", "peanut butter", "https://bit.ly/2CjIujB")

    erb :cookies
end

get "/cakes" do

    @space_cake = Cake.new("Hunky Chuncky Choco", "$12.99/cake", "chocolate cake", "https://bit.ly/2VIHLkI")
    @cheese_cake = Cake.new("Baked with premium cheese", "$15.99/cake", "cheesecake", "https://bit.ly/2CgPHk9")
    @coffee_cake = Cake.new("Perfect with a hot cup-o-joe", "$10.99/cake", "coffee cake", "https://bit.ly/2RQnb2I")
    erb :cakes
end

get "/muffins" do

    @corn_muffin = Muffin.new("This muffin is corny", "$.99/muffin", "corn muffin", "https://bit.ly/2SKIsIm")
    @blueberry_muffin = Muffin.new("Flavorful and fantastic", "$1.99/muffin", "blueberry muffin", "https://bit.ly/2Chh3qA")
    @pumpkin_muffin = Muffin.new("Perfectly pump-a-licious", "$1.99/muffin", "pumpkin muffin", "https://bit.ly/2CmBlPu")
    erb :muffins
end

post "/contact" do

    from = SendGrid::Email.new(email: 'aronwinston2792@gmail.com')
    to = SendGrid::Email.new(email: params[:usr_email])
    subject = 'betsys bakery'
    content = SendGrid::Content.new(
      type: 'text/plain', 
      value: 'Choclolate chip: $5.99/dz, Delicious and moist, Macarons: $4.99/dz, Bright and colorfull, Peanut butter: $6.99/dz, Creamy peanut butter, Chocolate cake: $12.99/cake, Hunky Chuncky Choco,
      Cheesecake: $15.99/cake, Baked with premium cheese, Coffe cake: $10.99/cake, Enjoy with coffee, Corn muffin: $.99/muffin, This muffin is corny, Blueberry muffin: $1.99/muffin, Flavorfull and fantastic,
      Pumpkin muffin: $1.99/muffin, perfectly pump-a-licious'
    )
    
    # create mail object with from, subject, to and content
    mail = SendGrid::Mail.new(from, subject, to, content)
    
    # sets up the api key
    sg = SendGrid::API.new(
      api_key: ENV["SENDGRID_API_KEY"]
    )
    
    # sends the email
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # display http response code
    puts response.status_code
    # display http response body
    puts response.body
    # display http response headers
    puts response.headers



   
    
    redirect "/"
 
end

get "/catalog" do 

    @catalog = [
        @chocolate_chip = Cookie.new("Delicious and moist", "$5.99/dz", "chocolate-chip","https://bit.ly/1yuIoLY"),
        @rainbow_cookie = Cookie.new("Bright and colorfull", "$4.99/dz", "macaron","https://bit.ly/2AMjb9G"),
        @peanut_cookie = Cookie.new("Creamy peanut butter", "$6.99/dz", "peanut butter", "https://bit.ly/2CjIujB"),
        @space_cake = Cake.new("Hunky Chuncky Choco", "$12.99/cake", "chocolate cake","https://bit.ly/2VIHLkI"),
        @cheese_cake = Cake.new("Baked with premium cheese", "$15.99/cake", "cheesecake","https://bit.ly/2CgPHk9"),
        @coffee_cake = Cake.new("Perfect with a hot cup-o-joe", "$10.99/cake", "coffee cake", "https://bit.ly/2RQnb2I"),
        @corn_muffin = Muffin.new("This muffin is corny", "$.99/muffin", "corn muffin", "https://bit.ly/2SKIsIm"),
        @blueberry_muffin = Muffin.new("Flavorful and fantastic", "$1.99/muffin", "blueberry muffin","https://bit.ly/2Chh3qA"),
        @pumpkin_muffin = Muffin.new("Perfectly pump-a-licious", "$1.99/muffin", "pumpkin muffin", "https://bit.ly/2CmBlPu")
            ]

    erb :catalog
end

def catalog_creater(array)
    array.each do |item|
        item.name
        item.price
        item.description
    end
   array
end

@catalog = [
    @chocolate_chip = Cookie.new("Delicious and moist", "$5.99/dz", "chocolate-chip","https://bit.ly/1yuIoLY"),
    @rainbow_cookie = Cookie.new("Bright and colorfull", "$4.99/dz", "macaron", "https://bit.ly/2AMjb9G"),
    @peanut_cookie = Cookie.new("Creamy peanut butter", "$6.99/dz", "peanut butter", "https://bit.ly/2CjIujB"),
    @space_cake = Cake.new("Hunky Chuncky Choco", "$12.99/cake", "chocolate cake", "https://bit.ly/2VIHLkI"),
    @cheese_cake = Cake.new("Baked with premium cheese", "$15.99/cake", "cheesecake", "https://bit.ly/2CgPHk9"),
    @coffee_cake = Cake.new("Perfect with a hot cup-o-joe", "$10.99/cake", "coffee cake", "https://bit.ly/2RQnb2I"),
    @corn_muffin = Muffin.new("This muffin is corny", "$.99/muffin", "corn muffin", "https://bit.ly/2SKIsIm"),
    @blueberry_muffin = Muffin.new("Flavorful and fantastic", "$1.99/muffin", "blueberry muffin", "https://bit.ly/2Chh3qA"),
    @pumpkin_muffin = Muffin.new("Perfectly pump-a-licious", "$1.99/muffin", "pumpkin muffin", "https://bit.ly/2CmBlPu")
        ]

catalog_creater(@catalog)











    