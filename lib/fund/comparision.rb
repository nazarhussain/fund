class Fund
  module Comparision

    # Comparision of of two funds
    #
    # @param other [Fund] Compare two funds
    def <=>(other)
      raise ArgumentError.new('You can only compare two funds.') if other.class != Fund

      @value <=> other.convert_to(@currency).value
    end
  end
end