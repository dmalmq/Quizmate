Challenge.destroy_all
Option.destroy_all
Question.destroy_all
Interest.destroy_all
Quiz.destroy_all
User.destroy_all

user1 = User.create!(
  email: "pooh@test.com",
  password: "123456"
)



# interest1 = Interest.create!(name: "architecture", user_id: user1.id)
#
# Quiz.create!(number_of_question: 2, user_id: user1.id)
#
#
# question1 = Question.create!(
#   title: "Key characteristics of architectural modernism",
#   content: "What are the key characteristics of architectural modernism?",
#
#   interest_id: interest1.id
# )
#
# question2 = Question.create!(
#   title: "History and impact of anime on popular culture",
#   content: "Can you provide an overview of the history and impact of anime on popular culture?",
#   interest_id: interest1.id
# )
#
# question3 = Question.create!(
#   title: "Exploring different genres in literature",
#   content: "What are some different genres in literature, and how do they differ from each other?",
#   interest_id: interest1.id
# )
#
# question4 = Question.create!(
#   title: "Understanding the rules and strategies of basketball",
#   content: "What are the fundamental rules and strategies one should know when playing basketball?",
#   interest_id: interest1.id
# )
#
# correct = Option.create!(
#   content: "Simplicity and minimalism",
#   question_id: question1.id
# )
# Option.create!(
#   content: "Emphasis on functionality",
#   question_id: question1.id
# )
# Option.create!(
#   content: "Use of industrial materials",
#   question_id: question1.id
# )
# Option.create!(
#   content: "Open floor plans and large windows",
#   question_id: question1.id
# )
#
# question1.correct_option_id = correct.id
#
# correct2 = Option.create!(
#   content: "Originated in Japan in the early 20th century",
#   question_id: question2.id
# )
# Option.create!(
#   content: "Influenced by Japanese traditional art styles",
#   question_id: question2.id
# )
# Option.create!(
#   content: "Gained international popularity in the 1980s and beyond",
#   question_id: question2.id
# )
# Option.create!(
#   content: "Has diverse genres and themes catering to various audiences",
#   question_id: question2.id
# )
#
# question2.correct_option_id = correct2.id
#
# correct3 = Option.create!(
#   content: "Fiction and non-fiction",
#   question_id: question3.id
# )
# Option.create!(
#   content: "Mystery and suspense",
#   question_id: question3.id
# )
# Option.create!(
#   content: "Science fiction and fantasy",
#   question_id: question3.id
# )
# Option.create!(
#   content: "Romance and historical fiction",
#   question_id: question3.id
# )
#
# question3.correct_option_id = correct3.id
#
# correct4 = Option.create!(
#   content: "Dribbling, passing, and shooting techniques",
#   question_id: question4.id
# )
# Option.create!(
#   content: "Offensive and defensive tactics",
#   question_id: question4.id
# )
# Option.create!(
#   content: "Teamwork and communication on the court",
#   question_id: question4.id
# )
# Option.create!(
#   content: "Understanding the court dimensions and positions",
#   question_id: question4.id
# )
#
# question4.correct_option_id = correct4.id
#
# question5 = Question.create!(
#   title: "architecture",
#   content: "Which architectural style is characterized by a minimalistic approach, emphasizing clean lines and simplicity?",
#   interest_id: interest1.id
# )
#
# correct5 = Option.create!(
#   content: "Gothic architecture",
#   question_id: question5.id
# )
#
# Option.create!(
#   content: "Neoclassical architecture",
#   question_id: question5.id
# )
#
# Option.create!(
#   content: "Modern architecture",
#   question_id: question5.id
# )
#
# Option.create!(
#   content: "Baroque architecture",
#   question_id: question5.id
# )
#
# question5.correct_option_id = correct5.id
#
# question6 = Question.create!(
#   title: "architecture",
#   content: "Who is known for designing the Fallingwater house, an iconic example of organic architecture?",
#   interest_id: interest1.id
# )
#
# correct6 = Option.create!(
#   content: "Frank Lloyd Wright",
#   question_id: question6.id
# )
#
# Option.create!(
#   content: "Le Corbusier",
#   question_id: question6.id
# )
#
# Option.create!(
#   content: "Ludwig Mies van der Rohe",
#   question_id: question6.id
# )
#
# Option.create!(
#   content: "Antoni Gaudí",
#   question_id: question6.id
# )
#
# question6.correct_option_id = correct6.id
#
# question7 = Question.create!(
#   title: "architecture",
#   content: "Which architect is famous for designing the Sydney Opera House",
#   interest_id: interest1.id
# )
#
# correct7 = Option.create!(
#   content: "Zaha Hadid",
#   question_id: question7.id
# )
#
# Option.create!(
#   content: "I. M. Pei",
#   question_id: question7.id
# )
#
# Option.create!(
#   content: "Jørn Utzon",
#   question_id: question7.id
# )
#
# Option.create!(
#   content: "Louis Kahn",
#   question_id: question7.id
# )
#
# question7.correct_option_id = correct7.id
#
# question8 = Question.create!(
#   title: "architecture",
#   content: "The Colosseum in Rome is an example of which architectural style?",
#   interest_id: interest1.id
# )
#
# correct8 = Option.create!(
#   content: "Romanesque architecture",
#   question_id: question8.id
# )
#
# Option.create!(
#   content: "Renaissance architecture",
#   question_id: question8.id
# )
#
# Option.create!(
#   content: "Classical architecture",
#   question_id: question8.id
# )
#
# Option.create!(
#   content: "Gothic architecture",
#   question_id: question8.id
# )
#
# question8.correct_option_id = correct8.id
#
# question9 = Question.create!(
#   title: "architecture",
#   content: "Which architect is associated with the design of the Guggenheim Museum in Bilbao?",
#   interest_id: interest1.id
# )
#
# correct9 = Option.create!(
#   content: "Renzo Piano",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Santiago Calatrava",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Richard Meier",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Frank Gehry",
#   question_id: question9.id
# )
#
# question9.correct_option_id = correct9.id
#
# question10 = Question.create!(
#   title: "architecture",
#   content: "Which architectural style is characterized by pointed arches, ribbed vaults, and flying buttresses?",
#   interest_id: interest1.id
# )
#
# correct10 = Option.create!(
#   content: "Rococo architecture",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Art Deco architecture",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Baroque architecture",
#   question_id: question9.id
# )
#
# Option.create!(
#   content: "Gothic architecture",
#   question_id: question9.id
# )
#
# question10.correct_option_id = correct10.id

