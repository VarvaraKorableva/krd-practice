=begin
2. Написать скрипт, который будет выводить массив покемонов
Спросит сколько добавить покемонов
Указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона
Выведет в консоль массив содержащий хеши покемонов в формате
[{ name: ‘Pikachu’, color: ‘Yellow’ }, … n times{}]
=end

arr = [] 

def count_info_func(arr)
puts 'Сколько добавить покемонов?'
quantity = gets.chomp.to_i #Приводит к целому числу, а если был не числовой ввод вернет 0
  if quantity <= 0
     puts 'Введите число больше 0:'
     quantity = gets.chomp.to_i
  else info_func(quantity, arr)
  end
end

def info_func(quantity, arr) 
quantity.times do
   puts 'Введите имя пакемона:'
   name_value = gets.chomp

   puts 'Введите цвет пакемона:'
   color_value = gets.chomp

   hash = { name: name_value, color: color_value }
   transform_func(arr, hash)
end
end

def transform_func(arr, hash) 
  result = (arr << hash)
  p result
end    

count_info_func(arr)