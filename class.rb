class Pastry

    attr_accessor :description, :price, :name, :image

    def initialize(description, price, name, image)
        @description = description
        @price = price
        @name = name
        @image = image
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

    def image()
        @image
    end
end

class Cookie < Pastry
end

class Cake < Pastry
end

class Muffin < Pastry
end