class Garment
  attr_reader :name, :type, :temperature

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map {|line| line.chomp}

    self.new(
      name: lines[0],
      type: lines[1],
      temperature: temperature_to_range(lines[2])
    )
  end

  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temperature = params[:temperature]
  end

  def self.temperature_to_range(lines)
    lines = lines.scan(/.\w+/)
    lines = Range.new(lines[0].to_i, lines[1].to_i)
  end

  def to_s
    "#{name} (#{type}) #{temperature}"
  end

  def suitable_for_the_weather?(user_temperature)
    temperature.include?(user_temperature)
  end
end
