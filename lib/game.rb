class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def play(letter)
    unless over? || @user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  def letters_to_guess
    result = []

    @letters.each do |letter|
      result << (@user_guesses.include?(letter) ? letter : nil)
    end

    return result
  end

  def word
    return @letters.join
  end

  def errors
    return @user_guesses - @letters
  end

  def errors_made
    return errors.count
  end

  def errors_allowed
    return TOTAL_ERRORS_ALLOWED - errors_made
  end

  def won?
    if lost?
      return false
    end

    return (@letters - @user_guesses).empty?
  end

  def over?
    return lost? || won?
  end

  def lost?
    return errors_allowed <= 0
  end
end
