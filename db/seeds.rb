# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Nastya")

ruby = Category.create(title: "Ruby")
yoga = Category.create(title: "Yoga")
cats = Category.create(title: "Cats")

ruby_basics = ruby.tests.create(title: "Ruby basics", level: 0)
ruby_meta = ruby.tests.create(title: "Ruby metaprogramming", level: 1)
yoga_hatha = yoga.tests.create(title: "Yoga Hatha", level: 2)
yoga_anatomy = yoga.tests.create(title: "Anatomy", level: 3)
cats_psychology = cats.tests.create(title: "Psychology", level: 1)

ruby_basics.questions.create(body: "How is array defined in Ruby?").tap do |question|
  question.answers.create([
    { body: "with square brackets", correct: true },
    { body: "with parenthesis", correct: false },
    { body: "with brace", correct: false }
  ])
end
ruby_basics.questions.create(body: "How is hash defined in Ruby?").tap do |question|
  question.answers.create([
    { body: "with square brackets", correct: false },
    { body: "with parenthesis", correct: false },
    { body: "with brace", correct: true }
  ])
end
yoga_hatha.questions.create(body: "What is Hatha yoga?").tap do |question|
  question.answers.create([
    { body: "it is the yoga of static poses", correct: true },
    { body: "it is a dynamic practice that consists of repeat movements", correct: false },
    { body: "it is yoga that works with voice", correct: false }
  ])
end
yoga_anatomy.questions.create(body: "What are the main regions of the spine?").tap do |question|
  question.answers.create([
    { body: "The spine consists of thoracic, cervical, lumbar and sacrum regions", correct: true },
    { body: "The spine consists of thoracic, lumbar and sacrum regions", correct: false },
    { body: "The spine consists of cervical, lumbar and sacrum regions", correct: false }
  ])
end

cats_psychology.questions.create(body: "What are the signs that the cat is nervous?").tap do |question|
  question.answers.create([
    { body: "Your Cat Hides Most Of The Time", correct: true },
    { body: "Kitty Can't Stop Grooming", correct: true },
    { body: "Kitty Follows You Everywhere", correct: true }
  ])
end