require_relative 'solution_service'

input = File.read('./puzzle_input.txt').split("\n")

result = input.map do |line|
	game = SolutionService.parse(line)
	game.max_power
end
p result.sum
# 72596