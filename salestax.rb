class Item
  attr_reader :name
  attr_accessor :quant, :price, :sales_tax, :import_tax

  def initialize (quant, name, price, sales_tax, import_tax)
    @quant = quant
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def tax
      sales_tax_rate = 0.10
      import_tax_rate = 0.05

      if @sales_tax == true && @import_tax == true
        @price * (sales_tax_rate + import_tax_rate)
      elsif @sales_tax == true && @import_tax == false
        @price * sales_tax_rate
      elsif @sales_tax == false && @import_tax == true
        @price * import_tax_rate
      else @sales_tax == false && @import_tax == false
        @price
      end
  end

  def self.total_item_cost
    @price + tax
  end

end # ends Item class

class Receipt
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add_to_cart(item)
    @basket.push(item)
    puts "test basket"
  end

  def start
    @basket.each do |x|
    puts "#{x.quant} #{x.name}: #{Item.total_item_cost}"
    puts "Sales Tax: "
    puts "Total:"
  end

end # end of Receipt class

# 001 Shopping Cart
s1 = Item.new(1, "book", 12.49, false, false )
s2 = Item.new(1, "music CD", 14.99, true, false)
s3 = Item.new(1, "chocolate bar", 0.85, false, false)
puts "#{@basket}"
# produce receipts
r1 = Receipt.new
r1.add_to_cart(s1)
r1.add_to_cart(s2)
r1.add_to_cart(s3)
r1.start
end
