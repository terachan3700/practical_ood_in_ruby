module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end

    def gear_inches
      puts ratio * wheel.diameter
    end

    def ratio
      chainring / cog.to_f
    end
  end
end


class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

# 外部モジュールを使用する箇所が複数あると、引数の並び順を変えられると辛い
SomeFramework::Gear.new(52,
                        11,
                        Wheel.new(26, 1.5)).gear_inches
