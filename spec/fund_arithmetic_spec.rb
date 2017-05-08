require 'spec_helper'

RSpec.describe 'Fund::Arithmetic' do

  it 'must add two same currency funds' do
    f1 = Fund.new(100)
    f2 = Fund.new(200)
    f3 = f1 + f2

    expect(f3.to_s).to eql '300 $'
  end

  it 'must add two different currency funds' do
    f1 = Fund.new(0.91, :eur)
    f2 = Fund.new(110, :pkr)
    f3 = f1 + f2

    expect(f3.convert_to(:usd).to_s).to eql '2.0 $'
  end

  it 'must subtract two different currency funds' do
    f1 = Fund.new(220, :pkr)
    f2 = Fund.new(0.91, :eur)

    f3 = f1 - f2
    expect(f3.convert_to(:usd).to_s).to eql '1 $'
  end

  it 'must multiply currency with number' do
    f1 = Fund.new(220, :pkr)
    f2 = f1 * 3
    expect(f2.convert_to(:usd).to_s).to eql '6 $'
  end

  it 'must divide currency with number' do
    f1 = Fund.new(220, :pkr)
    f2 = f1 / 2
    expect(f2.convert_to(:usd).to_s).to eql '1 $'
  end

  it 'if multiplied or divide two funds it must raise error' do
    f1 = Fund.new(220, :pkr)
    f2 = Fund.new(0.91, :eur)
    expect{ f1 * f2 }.to raise_error(ArgumentError)
    expect{ f1 / f2 }.to raise_error(ArgumentError)
  end
end