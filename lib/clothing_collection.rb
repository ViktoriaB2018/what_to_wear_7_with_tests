class ClothingCollection
  attr_reader :garments

  def self.from_dir(clothes_dir)
    files = Dir[File.join(clothes_dir, "*.txt")]
    garments = files.map { |file_path| Garment.from_file(file_path) }

    new(garments)
  end

  def initialize(garments)
    @garments = garments
  end

  def make_clothing_set(user_temperature)
    set_by_temp = @garments.select { |garment| garment.suitable_for_the_weather?(user_temperature) }
    @clothing_set = set_by_temp.shuffle.uniq { |garment| garment.type }
  end
end
