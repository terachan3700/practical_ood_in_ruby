class Bicycle
  attr_reader :size

  def initialize(args = {})
    @size = args[:size] #<- sizeから昇格した
    @chain = args[:chain]
    @tire_size = args[:tire_size]
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tepe_color = args[:tape_color]
    super(args)
  end

  def spares
    { chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end
end

class MounteinBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red')

puts road_bike.size

mountain_bike = MounteinBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.size
