$DATA = 'data.txt'
$BUFFER = 'buffer.txt'
$RESULTS = 'results.txt'

def ask_age
  puts "Сколько вам лет:"
  user_age = gets.chomp
  #user_age == "-1" ? nil : user_age
end

def index 
  File.foreach($DATA) { |id| puts id }
end  

def find(id)
  File.foreach($DATA).with_index do |line, index|
    puts line if index + 1 == id.to_i
  end
end 

def update(id, name) 
  file = File.open(BUFFER, 'w')
  File.foreach($DATA).with_index do |person, index|
    file.puts(id == index ? name : person)
  end  

  file.close
  File.write($DATA, File.read($BUFFER))

  File.delete($BUFFER) if File.exist?($BUFFER)
end 

def where(pattern)
  matching_lines = []

  File.foreach($DATA) do |line|
    words = line.split(/\W+/) # Разделяем строку на слова
    if words.include?(pattern.to_s)
      matching_lines << line.chomp
    end
  end

  matching_lines
end

def delete(id)
  file = File.open($BUFFER, 'w')

  File.foreach($DATA).with_index do |name, index|
    file.puts(name) unless id == index
  end

  file.close
  File.write($DATA, File.read($BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(name)
  new_entry = "#{name}\n"

  File.open($DATA, 'a') do |file|
    file.puts(new_entry)
  end
end

def display_results
  File.foreach($RESULTS) do |line|
    puts line
  end
end

#Очищаю файл резалт после каждого завершения программы
def clean_result
  File.open($RESULTS, 'w') do |file|
    file.puts("") # Открываю файл и перезаписываю его пустой строкой
  end
end  

def main
  total_lines = File.readlines($DATA).size # Oпределяет общее количество строк в файле DATA
  processed_lines = 0 # переменная отслеживает сколько строк было обработано
  already_processed = [] # инициализирует массив для отслеживания уже обработанных строк

  loop do
    user_age = ask_age
    break if user_age == "-1"

    matching_persons = where(user_age).reject do |person|
      if already_processed.include?(person)
        puts "Такой возраст уже записан."
        true
      else
        false
      end
    end

    if matching_persons.any?
      File.open($RESULTS, 'a') do |file|
        matching_persons.each do |person|
          file.puts(person)
          already_processed << person
        end
      end

      puts "Данные добавлены в файл RESULTS."
      processed_lines += matching_persons.size

      if processed_lines == total_lines
        puts "Все данные из файла DATA переписаны в файл RESULTS."
        display_results
        break
        
      end
    else
      puts "Пользователь с таким возрастом не найден."
    end
  end
  display_results
  clean_result
end

main