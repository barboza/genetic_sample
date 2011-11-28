require 'spec_helper'

describe Chromosome do

	before :each do
		@chromosome = Chromosome.new 1, 3, Array.[](1,2,3,4,5)

	end

	describe "#new" do
		it "Takes three parameters and returns a Chromosome object" do
			@chromosome.should be_an_instance_of Chromosome
		end
	end

	describe "#id" do
		it "returns de correct id" do
			@chromosome.id.should == 1
		end
	end

	describe "#fitness" do
		it "return the correct fitness" do
			@chromosome.fitness.should == 3
		end
	end

	describe "#data" do
		it "returns the correct data array" do
			@chromosome.data.should == [1,2,3,4,5]
		end
	end

end