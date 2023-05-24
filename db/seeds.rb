Option.destroy_all
Question.destroy_all
Interest.destroy_all
Quiz.destroy_all
User.destroy_all

user1 = User.create!(
  email: "pooh@test.com",
  password: "123456"
)

user2 = User.create!(
  email: "markusn@test.com",
  password: "123456"
)

# user3 = User.create!(
#   email: "daniel@test.com",
#   password: "123456"
# )

# user4 = User.create!(
#   email: "ameesha@test.com",
#   password: "123456"
# )

interest1 = Interest.create!(name: "architecture", user_id: user1.id)
interest2 = Interest.create!(name: "anime", user_id: user1.id)
interest3 = Interest.create!(name: "books", user_id: user2.id)
interest4 = Interest.create!(name: "sports", user_id: user2.id)

quiz1 = Quiz.create!(number_of_question: 10, user_id: user1.id)
# quiz2 = Quiz.create!(number_of_question: 10, user_id: user2.id)
# quiz3 = Quiz.create!(number_of_question: 1, user_id: user2.id)
# quiz4 = Quiz.create!(number_of_question: 1, user_id: user2.id)

question1 = Question.create!(
  title: "Key characteristics of architectural modernism",
  content: "What are the key characteristics of architectural modernism?",
  interest_id: interest1.id,
  quiz_id: quiz1.id,
  score: 0
)

question2 = Question.create!(
  title: "History and impact of anime on popular culture",
  content: "Can you provide an overview of the history and impact of anime on popular culture?",
  interest_id: interest2.id,
  quiz_id: quiz1.id,
  score: 0
)

question3 = Question.create!(
  title: "Exploring different genres in literature",
  content: "What are some different genres in literature, and how do they differ from each other?",
  interest_id: interest3.id,
  quiz_id: quiz1.id,
  score: 0
)

question4 = Question.create!(
  title: "Understanding the rules and strategies of basketball",
  content: "What are the fundamental rules and strategies one should know when playing basketball?",
  interest_id: interest4.id,
  quiz_id: quiz1.id,
  score: 0
)

correct = Option.create!(
  content: "Simplicity and minimalism",
  question_id: question1.id
)
Option.create!(
  content: "Emphasis on functionality",
  question_id: question1.id
)
Option.create!(
  content: "Use of industrial materials",
  question_id: question1.id
)
Option.create!(
  content: "Open floor plans and large windows",
  question_id: question1.id
)

question1.correct_option_id = correct.id


correct2 = Option.create!(
  content: "Originated in Japan in the early 20th century",
  question_id: question2.id
)
Option.create!(
  content: "Influenced by Japanese traditional art styles",
  question_id: question2.id
)
Option.create!(
  content: "Gained international popularity in the 1980s and beyond",
  question_id: question2.id
)
Option.create!(
  content: "Has diverse genres and themes catering to various audiences",
  question_id: question2.id
)

question2.correct_option_id = correct2.id


correct3 = Option.create!(
  content: "Fiction and non-fiction",
  question_id: question3.id
)
Option.create!(
  content: "Mystery and suspense",
  question_id: question3.id
)
Option.create!(
  content: "Science fiction and fantasy",
  question_id: question3.id
)
Option.create!(
  content: "Romance and historical fiction",
  question_id: question3.id
)

question3.correct_option_id = correct3.id

correct4 = Option.create!(
  content: "Dribbling, passing, and shooting techniques",
  question_id: question4.id
)
Option.create!(
  content: "Offensive and defensive tactics",
  question_id: question4.id
)
Option.create!(
  content: "Teamwork and communication on the court",
  question_id: question4.id
)
Option.create!(
  content: "Understanding the court dimensions and positions",
  question_id: question4.id
)

question4.correct_option_id = correct4.id
