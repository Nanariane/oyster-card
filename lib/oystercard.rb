class Oystercard

  attr_accessor :balance, :entry_station, :exit_station

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1


  def initialize
    @balance = 0
    # @in_use = false (autre facon de faire)
    @travel_history = []
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
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @entry_station = station
    @travel_history << exit_station
    # @in_use = true
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    # @in_use = false
    @entry_station = nil
    @exit_station = station
    @travel_history << exit_station
  end

end

private
def deduct(amount)
  @balance -= amount
end
