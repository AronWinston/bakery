class Cookie

    attr_accessor :description, :price

    def initialize(description, price)
        @description = description
        @price = price
    end

    def description()
        @description
    end

    def price()
        @price
    end
end

class Cake < Cookie
end

class Muffin < Cookie
end