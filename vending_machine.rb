class VendingMachine
  attr_reader :total_money

  def change
    change = @change
    @change = 0
    change
  end

  def initialize
    @total_money = 0
    @change = 0
  end

  def insert (money)
     case money
     when 10,50,100,500,1000
      @total_money += money
    else
      @change = money
    end
  end

  def refund
    change = @total_money
    @total_money = 0
    change
  end
end
