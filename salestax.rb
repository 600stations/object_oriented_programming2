class Item
attr_reader ### add variables
attr_accessor

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


end


class Receipt




end
