class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance


  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end


  def in_journey?
    return @in_use ? true : false
  end

  def touch_in
     @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
