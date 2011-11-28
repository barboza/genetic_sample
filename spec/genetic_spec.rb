require 'spec_helper'

describe "Genetic Object" do

	before :all do
		gen_obj = [
			Chromosome.new(0,0,[1,2,3,4,5]),
			Chromosome.new(1,2,[1,5,3,4,2]),
			Chromosome.new(2,3,[1,2,4,3,5]),
			Chromosome.new(3,0,[4,2,3,1,5]),
			Chromosome.new(4,2,[3,2,1,4,5]),
		]
		File.open "gens.yml", "w" do |f|
			f.write YAML::dump gen_obj
		end
	end

	before :each do
		@gens = Genetic.new "gens.yml"
	end

	describe "#new" do

		context "with a YAML file parameter" do
			it "has five books" do
				@gens.should have(5).chromosomes
			end
		end
	end

	it "returns all chromosomes with a given fitness" do
		@gens.get_chromosomes_with_fitness(2).length.should == 2
	end

	it "accepts new chromosomes" do
		@gens.add_chromosome( Chromosome.new(5, 3, [5,4,2,3,1]))
		@gens.get_chromosome(5).should be_an_instance_of Chromosome
	end

	it "saves the gens" do
		chromosomes = @gens.chromosomes.map { |chromosome| chromosome.id}
		@gens.save
		chromosomes2 = Genetic.new "gens.yml"
		chromosomes2 = chromosomes2.chromosomes.map { |chromosome| chromosome.id}
		chromosomes.should == chromosomes2
	end
end