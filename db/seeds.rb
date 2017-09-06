Kitten::delete_all

20.times do
	Kitten.create(
		name: 		Faker::Cat.name,
		age:			rand(20),
		cuteness: rand(10),
		softness: rand(10)
	)
end