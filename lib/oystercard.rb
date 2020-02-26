class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1


  def initialize
    @balance = 0
    # @in_use = false (autre facon de faire)
  end

  def deduct(amount)
    @balance -= amount
  end

  def top_up(amount)
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    fail "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  # def in_journey?
  #   # return @in_use ? true : false (autre facon de faire)
  #   @in_use
  # end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    @entry_station = station
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE

    # @in_use = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    # @in_use = false
    @entry_station = nil 
  end

end

private
def deduct(amount)
  @balance -= amount
end
