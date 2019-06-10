class ConsoleInterface
  FIGURES =
    Dir.glob(__dir__ + "/../data/figures/*.txt").map { |f| File.read(f) }

  def initialize(game)
    @game = game
  end

  def print_output
    cls!

    print "Слово: "
    puts @game.word_to_guess.map { |c| c || "__" }.join(" ")

    puts FIGURES[@game.errors_made]
    puts

    puts "Ошибки (#{@game.errors_made}): #{@game.errors.join(", ")}"
    puts "У вас осталось ошибок: #{@game.errors_allowed}"

    puts

    puts "Вы победили!" if @game.won?
  end

  def get_input
    print "Введите следующую букву: "
    input = gets
    input[0].upcase
  end

  private

  def cls!
    system('clear') || system('cls')
  end
end
