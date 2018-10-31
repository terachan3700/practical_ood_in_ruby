class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles, customers = nil, vehicle = nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(preparers)

    # 渡される対象のインスタンスにそれぞれprepare_tripを実装することで
    # いちいちインスタンスをチェックしなくてよくなる
    preparers.each do |preparer|
      preparer.prepare_trip(self)
    end
  end
end


# このクラスのインスタンスを渡すことになっても動作する。
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    puts "hello" + bicycle
  end
end

# TripCoordinatorとDriverを追加した
class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customer)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank
  end

  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end

  def fill_water_tank(vehicle)
  end
end


# bicycle = %w(a b c)
# machin = Mechanic.new
# trip = Trip.new(bicycle)
# trip.prepare machin