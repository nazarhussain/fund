class Fund
  # * Module to load the default configuration values
  module Default
    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Fund::Configuration.keys.map{ |key| [key, send(key)] }]
      end

      def default_currency
        :usd
      end

      # For adding more currencies please check the list at
      # https://en.wikipedia.org/wiki/Currency_symbol
      def supported_currencies
        [:usd, :eur, :pkr]
      end

      def currency_symbols
        { usd: '$',
          eur: '€',
          pkr: 'Rs'
        }
      end

      def currency_rates
        { usd: 1,
          eur: 0.91,
          pkr: 110
        }
      end

      def round_limit
        2
      end
    end
  end
end