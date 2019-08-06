require_relative 'lib/methods'

words = File.readlines(__dir__ + "/data/words.txt", chomp: true)

# Буквы слова
word = words.sample.chars

# Попытки игрока
user_guesses = []

# Неправильно названные буквы
errors = []

print_rules

while errors.count < 7 && (word - user_guesses).any?
  print_output(word, user_guesses, errors)
  letter = get_input
  user_guesses << letter
  errors = user_guesses - word
end

print_output(word, user_guesses, errors)
