class Bicycle
  attr_reader :style, :size, :tape_color,
              :front_shock, :rear_shock

  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tepe_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  # styleの確認は危険な道へ進む一歩
  def spares
    if style == :road
      { chain: '10-speed',
        tire_size: '23',
        tape_color: tape_color
      }
    else
      { chain: '10-speed',
        tire_size: '2.1',
        rear_shock: rear_shock
      }
    end
  end

  bike = Bicycle.new(
    style: :mountain,
    size: 'M',
    front_shock: 'Manitou',
    rear_shock: 'Fox')

  puts bike.spares

