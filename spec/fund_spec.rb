require 'spec_helper'

RSpec.describe Fund do
  it 'has a version number' do
    expect(Fund::VERSION).not_to be nil
  end

  it 'basic constructor should always work' do
    expect(Fund.new(100.11).value).to eql(100.11)
    expect(Fund.new(100.11).currency).to eql(Fund.config.default_currency)
  end

  it 'string representation should show currency symbol' do
    expect(Fund.new(111.22).to_s).to eql('111.22 $')
    expect(Fund.new(111.22, :eur).to_s).to eql('111.22 €')
  end
end
