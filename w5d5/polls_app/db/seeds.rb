# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   Rich doesn't read these :)



User.destroy_all
Response.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all

user1 = User.create!(username: 'Nick M')
user2 = User.create!(username: 'Ellis P')


# users = User.create([
#     {username: 'Nick'}, 
#     {username: 'Ellis'}, 
#     {username: 'Rich'}, 
#     {username: 'Paloma'},
#     {username: 'Josh'}
# ])

# polls = Poll.create!([
#     {title: 'Language Poll', author_id: users[4].id},
#     {title: 'Lunch Poll', author_id: users[0].id}
# ])

poll1 = Poll.create!(title: 'Language Poll', author_id: user1)
poll2 = Poll.create!(title: 'Lunch Poll', author_id: user2)


# questions = Question.create!([
#     {text: 'What is the best language?', poll_id: polls[0].id}, 
#     {text: 'what is for lunch', poll_id: polls[1].id}
# ])

q1 = Question.create!(text: 'What is the best language?', poll_id: poll1)
q2 = Question.create!(text: 'What is for lunch?', poll_id: poll2)

# ans_choices = AnswerChoice.create!([
#     {text: 'ruby', question_id: questions[0].id},
#     {text: 'JS', question_id: questions[0].id},  
#     {text: 'python', question_id: questions[0].id}, 
#     {text: 'BLT', question_id: questions[1].id}, 
#     {text: 'tears', question_id: questions[1].id},
#     {text: 'sushi', question_id: questions[1].id} 
# ])

ac1 = AnswerChoice.create!(text: 'Ruby', question_id: q1)
ac2 = AnswerChoice.create!(text: 'JS', question_id: q1)
ac3 = AnswerChoice.create!(text: 'Python', question_id: q1)
 
ac4 = AnswerChoice.create!(text: 'BLT', question_id: q2)
ac5 = AnswerChoice.create!(text: 'sushi', question_id: q2)
ac6 = AnswerChoice.create!(text: 'tears', question_id: q2)


# responses = Response.create!([
#     {user_id: users[0].id, answer_choice_id: ans_choices[2].id},
#     {user_id: users[1].id, answer_choice_id: ans_choices[1].id},
#     {user_id: users[2].id, answer_choice_id: ans_choices[0].id},
#     {user_id: users[3].id, answer_choice_id: ans_choices[3].id},
#     {user_id: users[4].id, answer_choice_id: ans_choices[4].id},
#     {user_id: users[0].id, answer_choice_id: ans_choices[5].id}
# ])

r1 = Response.create!(user_id: user1, answer_choice_id: ac1)
r2 = Response.create!(user_id: user2, answer_choice_id: ac6)