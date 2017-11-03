require_relative 'spacetaxi.rb'
require_relative 'passenger.rb'
class Buber
  attr_accessor :taxi_array
  @@taxi_names = ['bird', 'bumble', 'cow']
  def initialize (taxi_array=[])
    @taxi_array = taxi_array

end

  def run
   7.times do
     @taxi_array << Spacetaxi.new(@@taxi_names[rand(3)])
    end
    loop do
    add_passenger
    puts "Available taxis"
    print_list_of_taxis
    choose_a_taxi
    driving
    pay
    t2 = Thread.new(run_deoccupy)
    t2.join
    sleep 10
  end
  end

def run_deoccupy
@taxi_array.each do |taxi|
  taxi.deoccupy
  puts "Thread 2 is running "
  end
end

  def add_passenger
    puts "Your first name?"
    name=gets.chomp
    puts "Your last name?"
    last_name = gets.chomp
    puts "Where are you?"
    location = gets.chomp
    puts "How far are you travelling(km)?"
    distance = gets.to_i
    @pass = Passenger.new(name, last_name, location, distance)
  end

  def print_list_of_taxis
    @taxi_array.each_with_index do |taxi, index|
       puts "#{index+1}): #{taxi.name}" if taxi.available?
     end
  end

  def driving
    puts "Driving.."
    10.times do
      print '.'
      sleep 0.2
    end
  end

  def pay
    puts "#{@pass.first_name}, you have to pay #{@pass.distance*2.03}$"
    amount = gets.chomp.to_i
    total = @pass.distance*2.03.round(2)
    puts "#{total}"
    while amount< total
      total-=amount
      puts "Not enough!, please pay #{total} more"
      amount = gets.chomp.to_i
    end
    if amount > total
      puts "your change is #{(amount-total).round(2)}"
    else amount == total
      puts "have a nice day"
    end
    @taxi_array[@input].update_time
  end

  def choose_a_taxi
    puts "Please choose a taxi"
    @input = gets.chomp.to_i-1
    @taxi_array[@input].occupy
  end

end
