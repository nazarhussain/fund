require 'fund/version'
require 'fund/configuration'
require 'fund/default'
require 'fund/conversion'
require 'fund/arithmetic'
require 'fund/comparision'


# * Main Fund Module
class Fund
  extend Configuration
  include Fund::Conversion
  include Fund::Arithmetic
  include Comparable
  include Fund::Comparision

  attr_reader :value, :currency

  # Default initializer for the fund object
  #
  # @param value [BigDecimal] A value representing the fund
  # @param currency [Symbol, String] A value representing the fund currency
  #
  # @return [Fund]
  #
  # @example
  # Fund.new(200)
  # Fund.new(140.50, 'eur')
  # Fund.new(1785.4, :pkr)
  #
  # @raise
  # [ArgumentError] if provided currency is not valid
  #
  def initialize(value, currency = Fund.config.default_currency)
    @value = prettify(value)
    @currency = currency.to_sym

    unless Fund.config.supported_currencies.include? @currency
      raise ArgumentError.new("Provided currency #{@currency} is not enabled in Fund.config.supported_currencies")
    end
  end

  def to_s
    "#{@value} #{Fund.config.currency_symbols[@currency]}"
  end

  private

  def prettify(value)
    value == value.to_i ? value.to_i : value.round(Fund.config.round_limit)
  end
end

Fund.load_default
