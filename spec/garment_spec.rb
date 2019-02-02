require 'rspec'
require_relative '../lib/garment'

RSpec.describe Garment do
  before do
    @garment = described_class.from_file("#{__dir__}/fixtures/boots.txt")
  end

  describe '#from_file' do
    it 'creates the instance of class Garment' do
      expect(@garment).to be_a(Garment)
    end

    it 'translates temperature to range' do
      expect(Garment.temperature_to_range("(0, +10)")).to eq 0..10
    end

    it 'assigns instance variables' do
      expect(@garment).to have_attributes(
                            name: 'Ботинки',
                            type: 'Обувь',
                            temperature: 0..10
                          )
    end
  end

  describe '#to_s' do
    it 'returns garment description' do
      expect(@garment.to_s).to eq 'Ботинки (Обувь) 0..10'
    end
  end

  describe '#suitable_for_the_weather?' do
    context 'when garment suitable for current temperature' do
      it 'returns true' do
        expect(@garment.suitable_for_the_weather?(5)).to be_truthy
      end
    end

    context 'when garment does not suitable for current temperature' do
      it 'returns false' do
        expect(@garment.suitable_for_the_weather?(-5)).to be_falsey
      end
    end
  end
end
