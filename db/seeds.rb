# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: "mathematics"},
                              {title: "history"},
                              {title: "astronomy"}])

tests = Test.create([{title: "addition", category_id: 1, author_id: 1},
                     {title: "multiplication", level: 2, category_id: 1, author_id: 1},
                     {title: "translation", level: 3, category_id: 1, author_id: 1},
                     {title: "XX century", level: 2, category_id: 2, author_id: 2},
                     {title: "planets", category_id: 3, author_id: 3}])

questions = Question.create([{body: "12 + 5", test_id: 1},
                             {body: "20 + 5", test_id: 1},
                             {body: "125 * 8", test_id: 2},
                             {body: "10F(hex) in dec", test_id: 3},
                             {body: "The first Russian revolution", test_id: 4},
                             {body: "Name our planet", test_id: 5}])

answers = Answer.create([{body: "17", correct: 1, question_id: 1},
                         {body: "19", question_id: 1},
                         {body: "18", question_id: 1},
                         {body: "25", correct: 1, question_id: 2},
                         {body: "26", question_id: 2},
                         {body: "24", question_id: 2},
                         {body: "1000", correct: 1, question_id: 3},
                         {body: "1200", question_id: 3},
                         {body: "1100", question_id: 3},
                         {body: "271", correct: 1, question_id: 4},
                         {body: "273", question_id: 4},
                         {body: "261", question_id: 4},
                         {body: "1905", correct: 1, question_id: 5},
                         {body: "1917", question_id: 5},
                         {body: "1901", question_id: 5},
                         {body: "Earth", correct: 1, question_id: 6},
                         {body: "Mars", question_id: 6},
                         {body: "Moon", question_id: 6}])

users = User.create([{name: "user1", email: "user1@example.com", password_digest: "111"},
                     {name: "user2", email: "user1@example.com", password_digest: "222"},
                     {name: "user3", email: "user1@example.com", password_digest: "333"}])
