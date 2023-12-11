require_relative 'solution_service'

input = File.read('./puzzle_input.txt').split("\n")

result = input.map do |line|
	game = SolutionService.parse(line)
	game.possible? ? game.id : 0
end

p result.sum
#2061