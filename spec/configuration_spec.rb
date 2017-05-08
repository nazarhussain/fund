require 'spec_helper'

RSpec.describe Fund::Configuration do

  after(:each) do
    Fund.load_default
  end

  it 'has correct number of config options' do
    expect(Fund::Configuration.keys.count).to eql 5
  end

  it 'should have setup deafult language' do
    expect(Fund.config.default_currency).to eql(Fund::Default.default_currency)
  end

  it 'Changing default currency should work' do
    Fund.setup do |config|
      config.default_currency = :eur
    end
    expect(Fund.config.default_currency).to eql(:eur)
  end

  it 'Changing list of supported currencies' do
    Fund.setup do |config|
      config.supported_currencies = [:usd, :eur]
    end
    expect(Fund.config.supported_currencies).to eql([:usd, :eur])
  end

  it 'Currency add helper works perfect' do
    Fund.setup do |config|
      config.add :bit, 'Bit', 113.40
    end

    expect(Fund.config.supported_currencies).to include :bit
    expect(Fund.config.currency_rates[:bit]).to eql 113.40
    expect(Fund.config.currency_symbols[:bit]).to eql 'Bit'
  end
end
