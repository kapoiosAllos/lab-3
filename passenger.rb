class Passenger
  attr_accessor :first_name, :last_name, :location, :distance

  def initialize(first_name, last_name, location, distance)
    @first_name = first_name
    @last_name = last_name
    @location = location
    @distance = distance
  end

end
