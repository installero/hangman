def print_rules
  puts "Добро пожаловать в игру «Виселица»"
  puts "Сейчас мы загадаем слово, а вы будете отгадывать его по буквам."
  puts "Отгаданные буквы будут открываться, ошибки будут запоминаться."
  puts "Вы можете ошибиться с буквой только 7 раз!"
  puts "Для начала нажмите Enter"
  puts
  gets
end

def get_input
  print "Введите следующую букву: "
  input = gets
  input[0].upcase
end

def cls!
  system('clear') || system('cls')
end

def print_output(word, user_guesses, errors)
  cls!

  print "Слово: "
  puts word.map { |l| user_guesses.include?(l) ? l : "__" }.join(" ")

  puts "Ошибки (#{errors.count}): #{errors.join(", ")}"
  puts "У вас осталось ошибок: #{7 - errors.count}"

  puts

  if (word - user_guesses).empty?
    puts "Вы победили!"
  elsif errors.count == 7
    puts "Вы проиграли!"
  end
end
