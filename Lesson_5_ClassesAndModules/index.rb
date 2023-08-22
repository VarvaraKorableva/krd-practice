require_relative './CashMachine.rb'
$BALANCE = 'balance.txt'

def check_file
    balance = 100.0
    if File.exist?($BALANCE)
      File.foreach($BALANCE) do |line|
        balance = line.to_f
    end
    else 
      File.open($BALANCE, 'w') do |file|
        file.write(balance.to_s)  
    end
    end
    return balance
end

def change_balance(data) 
    File.write($BALANCE, data)
end

def actions(cash_machine)
  loop do
    puts "Для внесения денег нажмите D, \nДля снятия средств нажмите W, \nДля проверки баланса нажмите B, \nДля выхода нажмите Q"
    action = gets.chomp.upcase
    case action
    when 'D'
      loop do
        puts 'Введите сумму выше 0:'
        sum = gets.chomp.to_i
      
        if sum > 0
          cash_machine.increase_balance(sum)
          change_balance(cash_machine.current_balance)
          cash_machine.display_results
          break
        else
          puts 'Некорректная сумма, вводить можно только числа выше нуля.'
        end
      end
    when 'W'
      loop do
      puts "Введите сумму выше 0, но не выше #{cash_machine.current_balance}:"
      sum = gets.chomp.to_i
      if sum > 0 && sum <= cash_machine.current_balance
          cash_machine.decrease_balance(sum)
          change_balance(cash_machine.current_balance) 
          cash_machine.display_results
          break
        else
          puts 'Некорректная сумма, вводить можно только числа выше нуля и не более суммы вашего балланса.'
          cash_machine.display_results
        end
      end  
    when 'B'
      cash_machine.display_results
    when 'Q'
      puts 'Вы выбрали выход из программы'
      break
    else
      puts 'Введен некорректный симвом символ'
    end 
  end
end

def start 
  cash_machine = CashMachine.new(check_file)
  actions(cash_machine)
end  
    
start

