require_relative '../methods'
$BUFFER = '../taskOneAndTwo/buffer.txt'
$BALANCE = 'balance.txt'
$balance = 100.00

def display_results
  File.foreach($BALANCE) do |line|
    puts "Ваш баланс: " + line
    $balance = line
  end
end

def check_file
  if File.exist?($BALANCE)
    puts "Файл существует."
    display_results
  else
    puts "Файл не существует."
    #$balance = 100.00
    puts "Ваш баланс:" + $balance
  end
end  

def increase_balance(sum) 
  file_contents = File.read($BALANCE).to_i
  updated_sum = file_contents + sum.to_i

  File.write($BALANCE, updated_sum.to_s)
end

def decrease_balance(sum) 
  file_contents = File.read($BALANCE).to_i
  updated_sum = file_contents - sum.to_i

  File.write($BALANCE, updated_sum.to_s)
end

def actions
  
  puts "Для внесения денег нажмите D, \nДля снятия средств нажмите W, \nДля проверки баланса нажмите B, \nДля выхода нажмите Q"
  action = gets.chomp.upcase
  case action
  when 'D'
    loop do
      puts 'Введите сумму выше 0:'
      sum = gets.chomp.to_i
    
      if sum > 0
        increase_balance(sum)
        display_results
        $balance = $balance.to_i + sum.to_i
        break
      else
        puts 'Некорректная сумма, вводить можно только числа выше нуля.'
      end
    end
  when 'W'
    loop do
    puts "Введите сумму выше 0, но не выше #{$balance}:"
    sum = gets.chomp.to_i
    if sum > 0 && sum <= $balance.to_f
        decrease_balance(sum)
        display_results
        $balance = $balance.to_i - sum.to_i
        break
      else
        puts 'Некорректная сумма, вводить можно только числа выше нуля и не более суммы вашего балланса.'
        display_results
      end
    end  
  when 'B'
    display_results
  when 'Q'
    puts 'Вы выбрали выход из программы'
  else
    puts 'Введен некорректный симвом символ'
  end 
end

def start 
  check_file
  actions
end  
  
start

