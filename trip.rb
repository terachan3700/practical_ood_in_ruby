class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles, customers = nil, vehicle = nil)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  # この'mechanic'引数はどんなクラスのものでも良い
  def prepare(preparers)

    # 出口のないコード　危険な匂いがする
    preparers.each do |preparer|
      case preparer
      when Machanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Drier
        preparer.gas_up(vehicle)
        preparer.fill_water_tank
      end
    end
  end
end

# TripCoordinatorとDriverを追加した
class TripCoordinator
  def buy_food(customers)
  end
end

class Driver
  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end

  def fill_water_tank(vehicle)
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

# bicycle = %w(a b c)
# machin = Mechanic.new
# trip = Trip.new(bicycle)
# trip.prepare machin