class Genetic
	attr_accessor :chromosomes

	def initialize gens_file = false
		@gens_file = gens_file
		@chromosomes = @gens_file ? YAML::load(File.read(@gens_file)) : []
	end

	def get_chromosomes_with_fitness fitness
		@chromosomes.select do |chromosome|
			chromosome.fitness == fitness
		end
	end

	def add_chromosome chromosome
		@chromosomes.push chromosome
	end

	def get_chromosome id
		@chromosomes.select do |chromosome|
			chromosome.id == id
		end.first
	end

	def save gens_file = false
		@gens_file = gens_file || @gens_file || "gens.yml"
		File.open @gens_file, "w" do |f|
			f.write YAML::dump @chromosomes
		end
	end
end