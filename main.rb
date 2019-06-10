require_relative 'lib/game'
require_relative 'lib/console_interface'

words = File.readlines(__dir__ + "/data/words.txt", chomp: true)

game = Game.new(words.sample)
console_interface = ConsoleInterface.new(game)

until game.over?
  console_interface.print_output
  letter = console_interface.get_input
  game.play(letter)
end

console_interface.print_output
