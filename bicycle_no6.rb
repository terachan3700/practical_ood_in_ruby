class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tepe_color = args[:tape_color]
  end

  # 全ての自転車はデフォルト値として
  # 同じタイヤサイズとチェーンサイズをもつ
  def spares
    { chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end

  # 他にもメソッドがたくさん、、、

end

bike = Bicycle.new(size: 'M', tape_color: 'red')

puts bike.size
puts bike.spares

