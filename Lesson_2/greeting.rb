def greeting
    puts "Привет, Введи свое имя:"
    name = gets.capitalize.chomp

    puts "Введи свою фамилию:"
    surname = gets.capitalize.chomp

    puts "Введи свой возраст:"
    age = gets.chomp.to_i

    while age <= 0
        puts "С возрастом что-то не так, попробуй снова:"
        age = gets.chomp.to_i
    end

    if age < 18
        puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано." 
    else     
        puts "Привет, #{name} #{surname}. Самое время заняться делом!" 
    end        
end    

greeting()

