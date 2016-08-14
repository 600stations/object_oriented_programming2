class Item
  attr_reader :name
  attr_accessor :quant, :price, :sales_tax, :import_tax, :total_tax, :total_item_cost

  def initialize (quant, name, price, sales_tax, import_tax)
    @quant = quant
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
    @total_tax = total_tax
    @total_item_cost = 0

  end

  def tax
      #@@sales_tax_total = 0
      sales_tax_rate = 0.10
      import_tax_rate = 0.05

      if @sales_tax == true && @import_tax == true
        @total_tax = @price * (sales_tax_rate + import_tax_rate)
      elsif @sales_tax == true && @import_tax == false
        @total_tax = @price * sales_tax_rate
      elsif @sales_tax == false && @import_tax == true
        @total_tax = @price * import_tax_rate
      else @sales_tax == false && @import_tax == false
        @total_tax = 0
      end
    #  @@sales_tax_total+=@total_tax
  end

  def total_item_cost
    @total_item_cost = @price + tax
  end

end # ends Item class

class Receipt < Item
  attr_accessor :basket
  attr_accessor :total_tax, :total

  def initialize
    @basket = []
    @@sales_tax_total = 0
    @@basket_total_sale = 0

  end

  def add_to_cart(item)
    @basket << item
    @@sales_tax_total += item.tax
    @@basket_total_sale += item.total_item_cost

  end

  def start
    @basket.each do |x|
    puts "#{x.quant} #{x.name}: #{x.total_item_cost.round(2)}"
  end
  puts "Sales Tax: #{@@sales_tax_total.round(2)}"
  puts "Total: #{@@basket_total_sale.round(2)}"


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
