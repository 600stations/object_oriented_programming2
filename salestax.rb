class Item
  attr_reader :name, :price, :sales_tax, :import_tax
  attr_accessor :quant

  def initialize (quant, name, price, sales_tax, import_tax)
    @quant = quant
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def tax

      sales_tax_rate= 0.10
      import_tax_rate = 0.05

      if @sales_tax == true && @import_tax == true
         @price * (sales_tax_rate + import_tax_rate)
      elsif @sales_tax == true && @import_tax == false
        @price * sales_tax_rate
      elsif @sales_tax == false && @import_tax == true
        @price * import_tax_rate
      else @sales_tax == false && @import_tax == false
        0
      end
  end

  def total_item_cost #this method stores total cost per item incl. taxes
    @price + tax
  end

end
# ends Item class

class Receipt
  attr_accessor :basket

  def initialize
    @basket = []
    @@sales_tax_total = 0
    @@basket_total_sale = 0

  end

  def add_to_cart(purchase)
    @basket << purchase
    @@sales_tax_total += purchase.tax
    @@basket_total_sale += purchase.total_item_cost

  end

  def start
    @basket.each do |element|
    puts "#{element.quant} #{element.name}: #{'%.02f' % element.total_item_cost}"
  end
  puts
  puts "Shopping Cart Totals:"
  puts "Sales Tax: #{'%.02f' % @@sales_tax_total}"
  puts "Total: #{'%.02f' % @@basket_total_sale}"
  puts
  end
end# end of Receipt class

# 001 Shopping Cart
s1 = Item.new(1, "book", 12.49, false, false )
s2 = Item.new(1, "music CD", 14.99, true, false)
s3 = Item.new(1, "chocolate bar", 0.85, false, false)

# produce receipts for Shopping Cart One
r1 = Receipt.new
r1.add_to_cart(s1)
r1.add_to_cart(s2)
r1.add_to_cart(s3)
r1.start

# 002 Second Shopping Cart
s4 = Item.new(1, "imported box of chocolates", 10.00, false, true)
s5 = Item.new(1, "imported bottle of perfume", 47.50, true, true)
#
# 002 receipts for Second Shopping Cart
r2 = Receipt.new
r2.add_to_cart(s4)
r2.add_to_cart(s5)
r2.start
#
# 003 Third Shopping Cart
s6 = Item.new(1, "imported bottle of perfume", 27.99, true, true)
s7 = Item.new(1, "bottle of perfume", 18.99, true, false)
s8 = Item.new(1, "packet of headache pills", 9.75, false, false)
s9 = Item.new(1, "box of imported chocolates", 11.25, false, true)
# 003 receipts for Third Shopping Cart
r3 = Receipt.new
r3.add_to_cart(s6)
r3.add_to_cart(s7)
r3.add_to_cart(s8)
r3.add_to_cart(s9)
r3.start
