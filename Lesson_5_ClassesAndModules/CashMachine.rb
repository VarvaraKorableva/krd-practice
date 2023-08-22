class CashMachine
  attr_reader :current_balance
  def initialize(balance)
    @current_balance = balance
  end

  def display_results
    puts "Ваш баланс: #{@current_balance}"
  end
  
  def increase_balance(sum) 
    @current_balance += sum.to_f
  end
  
  def decrease_balance(sum) 
    @current_balance -= sum.to_f
  end

  def out
    puts 'Вы выбрали выход из программы'
  end  
end


