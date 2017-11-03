class Spacetaxi
  attr_accessor :available, :name, :time

  def initialize(name="name", available = true, time=0)
    @name = name
    @available = available
    @time = time
  end

  def available?
    @available
  end

  def occupy
    @available = false
  end

  def deoccupy
    if Time.now.to_i > @time+10
      @available = true
    end
  end

def update_time
  @time = Time.now.to_i
end


end
