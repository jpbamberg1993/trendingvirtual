100.times do |n|
  title = Faker::Lorem.words(rand(7)+5).join(' ').capitalize
  text = Faker::Lorem.paragraph(100..250)
  author = Faker::Name.name
  Article.create!(title: title,
                  text: text,
                  author: author)
end
