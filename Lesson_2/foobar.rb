#2. Написать метод foobar, который принимает пару чисел, если хотя бы одно равно 20 - возвращает второе число, в противном случае выводит сумму этих чисел.

def foobar (number_one, number_two)
    if number_one == 20 || number_two == 20
        puts "#{number_two}"
    else
        puts "#{number_one + number_two}"
    end
end  

foobar(6, 24)