class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles, customers = nil, vehicle = nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  # この'mechanic'引数はどんなクラスのものでも良い
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

# このクラスのインスタンスを渡すことになっても動作する。
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    puts "hello" + bicycle
  end
end

bicycle = %w(a b c)
machin = Mechanic.new
trip = Trip.new(bicycle)
trip.prepare machin