class SolutionService
	attr_reader :id, :rounds

	def initialize(id, rounds)
		@id = id
		@rounds = rounds
	end

	def self.parse(line)
		first, *last = line.chomp.split(/[:;]/)
		id = first.split.last.to_i
		rounds = last.map do |str_round|
			str_round.split(',').map do |str_card|
				count, color = str_card.split
				[color.to_sym, count.to_i]
			end.to_h
		end

		new(id, rounds)
	end

	def possible?
		max_cubes.all? { |color, count| count <= max_limits[color] }
	end

	def max_limits
		{ red: 12, green: 13, blue: 14 }
	end

	def max_power
		max_cubes.values.inject(:*)
	end

	def max_cubes
		rounds.each_with_object(red: 0, blue: 0, green: 0) do |round, counts|
			round.each { |color, count| counts[color] = count if count > counts[color] }
		end
	end
end
