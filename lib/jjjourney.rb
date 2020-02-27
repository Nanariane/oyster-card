class Journey
  attr_reader :entry_station, :exit_station


  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end

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


end
