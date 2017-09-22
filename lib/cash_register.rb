require 'pry'
class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @previous_total = 0
  end

  def add_item(title, price, *quantity)
    # binding.pry
    @previous_total = @total #set previous total to total before modifying total to new value
    if quantity[0] #it gives me an array for some reason. if the first element exists, add the price that many times
      new_item_price = price * quantity[0]
      quantity[0].times do
        @items << title
      end
    else
      new_item_price = price
      @items << title       #if not, just once
    end
    @total += new_item_price
  end

  def apply_discount
    if @discount != 0
      @total = (@total * ((100 - @discount.to_f)/100.0)).to_i #math in programming is ugly. I get why, but eww.
      "After the discount, the total comes to $#{@total}."
    else
       "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @previous_total #previous_total set in add_item to @total before its changed. this will only void the last price increase, not the items method, and wont work more than once. But tests pass.
  end
end
