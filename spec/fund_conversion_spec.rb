require 'spec_helper'

RSpec.describe 'Fund::Conversion' do

  it 'it should convert funds correct from default currency' do
    f = Fund.new(1, :usd)
    expect(f.convert_to(:eur).to_s).to eql('0.91 €')
    expect(f.convert_to(:pkr).to_s).to eql '110 Rs'
  end

  it 'it should convert fund correct from non default currency' do
    f = Fund.new(110, :pkr)
    expect(f.convert_to(:usd).to_s).to eql('1 $')
    expect(f.convert_to(:eur).to_s).to eql '0.91 €'
  end
end
