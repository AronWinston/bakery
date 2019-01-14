class Cookie

    attr_accessor :description, :price, :name

    def initialize(description, price, name)
        @description = description
        @price = price
        @name = name
    end

    def description()
        @description
    end

    def price()
        @price
    end

    def name()
        @name
    end
end

class Cake < Cookie
end

class Muffin < Cookie
end