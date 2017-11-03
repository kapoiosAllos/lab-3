require_relative 'buber.rb'
#Buber.new.run

t1 = Thread.new(Buber.new.run)

t1.join
