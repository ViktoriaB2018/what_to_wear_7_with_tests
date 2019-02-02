require_relative 'lib/garment'
require_relative 'lib/clothing_collection'

folder_with_clothes = 'data'
clothes_dir = File.join(__dir__, "#{folder_with_clothes}")

clothing_collection = ClothingCollection.from_dir(clothes_dir)

puts 'Сколько градусов за окном? (можно с минусом)'
user_temperature = gets.to_i

clothing_set = clothing_collection.make_clothing_set(user_temperature)

puts 'Предлагаем сегодня надеть:'
puts
puts clothing_set

# Спрашиваем второй раз
puts
puts 'Сколько градусов за окном? (можно с минусом)'
user_temperature_1 = gets.to_i

clothing_set_1 = clothing_collection.make_clothing_set(user_temperature_1)

puts 'Предлагаем сегодня надеть:'
puts
puts clothing_set_1
