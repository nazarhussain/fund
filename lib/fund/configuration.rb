class Fund
  # * Module to setup the configuration
  module Configuration
    attr_accessor :default_currency, :supported_currencies, :currency_symbols
    attr_accessor :currency_rates, :round_limit

    class << self
      # List of configurable keys for {Fund::Client}
      # @return [Array] of option keys
      def keys
        # Reject all setters to get keys of only attributes
        # Also reject other utility methods for the class
        @keys ||= Fund::Configuration.public_instance_methods.reject { |method| method =~ /^.*=$/ } -
                  [:setup, :load_default, :config, :add]
      end
    end

    # Set configuration options using a block
    #
    # Fund.setup do |config|
    #   config.supported_currencies = [:usd, :eur]
    # end
    # Fund.setup do |config|
    #   config.add :bit, 'Bit', 113.40
    # end
    def setup
      yield self
    end

    # Utility method to add a new language in configuration
    #
    # @param currency [Symbol] A symbol representing the currency e.g. :usd, :eur
    # @param symbol [String] A string representation of the currency e.g. $
    # @param rate [Float] A floating number showing the currency rate with respect to default currency. See [Configuration::Default] for more reference
    #
    def add(currency, symbol, rate)
      @supported_currencies << currency
      @currency_symbols[currency] = symbol
      @currency_rates[currency] = rate
    end

    def load_default
      Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", Fund::Default.options[key])
      end
      self
    end

    def config
      self
    end
  end
end

