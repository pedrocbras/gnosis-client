require 'faker'

user = FactoryBot.create(:user, role: :research_group)

6.times do |n|
	title = Faker::Lorem.sentences(number: 1)
	body = Faker::Lorem.paragraph
  author = Faker::Name.name
  
	Article.create!(
		title: title,
		body: body,
    author: user,
		created_at: '')
		puts "created article #{n+1}"
end