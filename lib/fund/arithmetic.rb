class Fund
  module Arithmetic

    def +(other)
      Fund.new(@value + other.convert_to(@currency).value, @currency)
    end

    def -(other)
      Fund.new(@value - other.convert_to(@currency).value, @currency)
    end

    def *(other)
      raise ArgumentError.new('Fund can\'t be multiplied by funds. It must be Intger or Float.') if other.class == Fund

      @value *= other
      self
    end

    def /(other)
      raise ArgumentError.new('Fund can\'t be multiplied by funds. It must be Intger or Float.') if other.class == Fund

      @value /= other
      self
    end
  end
end