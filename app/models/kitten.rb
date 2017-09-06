class Kitten < ApplicationRecord
	# validates: name, {max_lenght: [20]}
	validates :name, 			presence: true, length: { maximum: 20 }
	validates :age,				presence: true
	validates :cuteness, 	presence: true
	validates :softness, 	presence: true
end
