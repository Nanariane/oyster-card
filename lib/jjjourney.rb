class Journey
  attr_reader :entry_station, :exit_station

  def complete?
    @complete
  end

  def fare
    PENALTY_FARE
  end

  def finish(station=nil)
    @exit_station = station
    @complete = true
    self
  end


  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end

end


private
def penalty?
  (!entry_station || !exit_station)
end
