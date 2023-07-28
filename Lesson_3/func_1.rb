=begin 
1. Написать скрипт, который будет принимать слово, 
если слово заканчивается на “CS” (в любом регистре) - 
выводит на экран цифру 2 в степени (длины введенного слова), 
если не заканчивается - выводит слово задом наперед

* Код должен быть организован в методы
=end

def get_word(word)
  power = word.length
  str = word.downcase
  if (str[-2] + str[-1]) == 'cs'
   return 2 ** power
  else 
    return word.reverse
  end
end    


result = get_word('dfghhijkgukyfgkcs')
puts result

