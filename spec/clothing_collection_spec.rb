require 'rspec'
require_relative '../lib/clothing_collection'
require_relative '../lib/garment'

RSpec.describe ClothingCollection do
  before do
    @clothing_collection = described_class.from_dir(File.join(__dir__, 'fixtures'))
  end

  describe '#from_dir' do
    it 'creates the instance of class ClothingCollection' do
      expect(@clothing_collection).to be_a(ClothingCollection)
    end

    it 'should read files and return array of clothes' do
      expect(@clothing_collection.garments.size).to eq Dir[__dir__ + '/fixtures/*.txt'].length
    end

    it 'assigns instance variables' do
      expect(@clothing_collection).to eq(@clothing_collection)
    end
  end

  describe '#make_clothing_set' do
    it 'makes clothing set' do
      clothing_set = @clothing_collection.make_clothing_set(5)
      expect(clothing_set.to_s).to match_array([
                                     'Джинсы (Штаны) -5..15',
                                     'Пальто (Верхняя одежда) -5..5',
                                     'Ботинки (Обувь) 0..10'
                                   ])
    end
  end
end
