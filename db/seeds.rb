require 'faker'

6.times do |n|
	title = Faker::Lorem.sentences(number: 1)
	body = Faker::Lorem.paragraph
	author = Faker::Name.name

	Article.create!(
		title: title,
		body: body,
		author: author)
		puts "created article #{n+1}"
end