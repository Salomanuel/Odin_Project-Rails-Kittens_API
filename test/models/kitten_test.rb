require 'test_helper'

class KittenTest < ActiveSupport::TestCase
	def setup
		@kitten = Kitten.new(name: "Gatto", 
												age: 10,
												cuteness: 5,
												softness: 5)
	end

	test "it should work" do
		assert @kitten.valid?
	end

	test "should have a name" do
		@kitten.name = "  "
		assert_not @kitten.valid?
	end

	test "name can't be too long" do
		@kitten.name = "a" * 21
		assert_not @kitten.valid?
	end

	test "should have an age" do
		@kitten.age = nil
		assert_not @kitten.valid?
	end

	test "should have cuteness" do
		@kitten.cuteness = nil
		assert_not @kitten.valid?
	end

	test "should have softness" do
		@kitten.softness = nil
		assert_not @kitten.valid?
	end
end
