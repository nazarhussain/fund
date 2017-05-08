require 'spec_helper'

RSpec.describe 'Fund::Comparision' do

  it 'currency fund must be equal to its own' do
    f1 = Fund.new(100)
    expect(f1 == f1).to be_truthy
  end

  it 'currency fund in different currencies must comparable' do
    f1 = Fund.new(0.91, :eur)
    f2 = Fund.new(110, :pkr)
    expect(f1 == f2).to be_truthy
  end

  it 'currency fund in different currencies must comparable' do
    f1 = Fund.new(0.91, :eur)
    f2 = Fund.new(220, :pkr)
    expect(f2 > f1).to be_truthy
    expect(f1 < f2).to be_truthy
  end

  it 'currency fund with minor difference would not be equal' do
    f1 = Fund.new(0.91, :eur)
    f2 = Fund.new(1.1, :usd)
    expect(f1 == f2).to be_falsey
  end
end