class Fund
  module Conversion

    # Convert one fund to other currency
    #
    # @param other_currency [Symbol, String] Symbol or string representing other currency
    #
    # @return [Fund]
    #
    def convert_to(other_currency)
      other_currency = other_currency.to_sym

      Fund.new(@value * conversion_rate_for(other_currency), other_currency)
    end

    # Get conversion rate for a currency that used to be multiplied in conversion
    #
    # @param other_currency [Symbol] symbol representing other currency
    #
    # @return [Float]
    #
    def conversion_rate_for(other_currency)
      # If both currencies are same then conversion rate is 1
      if @currency == other_currency
        1

      # If rate required for base currency then divide currency rates with 1
      elsif other_currency == Fund.config.default_currency
        1.0 / Fund.config.currency_rates[@currency].to_f

      # If rate required for currency other than base then first convert base currency rate
      # and then multiply with target currency rate
      else
        Fund.config.currency_rates[other_currency] * (1.0 / Fund.config.currency_rates[@currency].to_f)
      end
    end
  end
end