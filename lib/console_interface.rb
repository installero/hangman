class ConsoleInterface
  FIGURES =
    Dir[__dir__ + "/../data/figures/*.txt"].sort.map { |f| File.read(f) }

  def initialize(game)
    @game = game
  end

  def print_output
    cls!

    puts "Слово: #{word_to_show}"
    puts

    puts FIGURES[@game.errors_made]
    puts

    puts "Ошибки (#{@game.errors_made}): #{@game.errors.join(", ")}"
    puts "У вас осталось ошибок: #{@game.errors_allowed}"

    puts
    if @game.won?
      puts "Вы победили!"
    elsif @game.lost?
      puts "Вы проиграли, было загадано слово \"#{@game.word}\""
    end
  end

  def word_to_show
    result = []

    @game.letters_to_guess.each do |letter|
      result << (letter.nil? ? "__" : letter)
    end

    return result.join(" ")
  end

  def get_input
    input = ""

    while input.empty?
      print "Введите следующую букву: "
      input = gets.chomp
    end

    return input[0].upcase
  end

  def cls!
    system('clear') || system('cls')
  end
end
