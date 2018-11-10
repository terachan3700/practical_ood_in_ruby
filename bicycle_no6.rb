class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed' #<- 共通の初期値
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannot responto:#{__method__}"
  end

  def spares
    { tire_size: tire_size,
      chain: chain }
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

  def default_tire_size
    '23'
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

  def default_tire_size
    '2.1'
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(args)
    @flag = args[:flag] # 'super'を送信するのを忘れた
  end

  def spares
    super.merge({flag: flag})
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red')

puts road_bike.tire_size
puts road_bike.chain

mountain_bike = MounteinBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.tire_size
puts mountain_bike.chain

bent = RecumbentBike.new(flag: 'tall and orange')
puts bent.spares

