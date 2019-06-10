require 'set'

class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @word = word.each_char.to_a
    @user_guesses = Set.new
  end

  # Метод, возвращающий загаднное слово без букв Й/Ё
  def normalized_word
    @word.map { |letter| normalize_letter(letter) }
  end

  # Метод, возвращающий слово с пропусками
  #
  # Например, в слове "КОРОВА" отгадали пока только буквы "О"
  # Этот метод вернёт [nil, "О", nil, "О", nil nil]
  def word_to_guess
    @word.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      else
        nil
      end
    end
  end

  # Неправильно названные буквы
  def errors
    @user_guesses.to_a - normalized_word
  end

  # Сколько сделано ошибок
  def errors_made
    errors.count
  end

  # Сколько ещё можно совершить ошибок
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  # Выиграна ли игра?
  def won?
    # Все буквы слова были названы
    (normalized_word - @user_guesses.to_a).empty?
  end

  # Закончена ли игра?
  def over?
    # Проиграна или выиграна = закончена
    errors_allowed == 0 || won?
  end

  def play(letter)
    raise RuntimeError.new("Игра закончена!") if over?

    @user_guesses << normalize_letter(letter)
  end

  private

  def normalize_letter(letter)
    case letter
    when "Ё"
      "Е"
    when "Й"
      "И"
    else
      letter
    end
  end
end
