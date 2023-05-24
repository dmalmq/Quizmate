
Option.destroy_all
Question.destroy_all
Interest.destroy_all
Quiz.destroy_all
User.destroy_all


user1 = User.create!(
  email: "pooh@test.com",
  password: "123456"
)

interest1 = Interest.create!(name: "architecture", user: user1)

Quiz.create!(number_of_question: 2, user: user1)


question1 = Question.create!(
  title: "What are the key characteristics of architectural modernism?",
  content: "What are the key characteristics of architectural modernism?",

  interest: interest1
)

question2 = Question.create!(
  title: "Can you provide an overview of the history and impact of anime on popular culture?",
  content: "Can you provide an overview of the history and impact of anime on popular culture?",
  interest: interest1
)

question3 = Question.create!(
  title: "What are some different genres in literature, and how do they differ from each other?",
  content: "What are some different genres in literature, and how do they differ from each other?",
  interest: interest1
)

question4 = Question.create!(
  title: "What are the fundamental rules and strategies one should know when playing basketball?",
  content: "What are the fundamental rules and strategies one should know when playing basketball?",
  interest: interest1
)

correct = Option.create!(
  content: "Simplicity and minimalism",
  question: question1
)
Option.create!(
  content: "Emphasis on functionality",
  question: question1
)
Option.create!(
  content: "Use of industrial materials",
  question: question1
)
Option.create!(
  content: "Open floor plans and large windows",
  question: question1
)

question1.correct_option = correct
question1.save
correct2 = Option.create!(
  content: "Originated in Japan in the early 20th century",
  question: question2
)
Option.create!(
  content: "Influenced by Japanese traditional art styles",
  question: question2
)
Option.create!(
  content: "Gained international popularity in the 1980s and beyond",
  question: question2
)
Option.create!(
  content: "Has diverse genres and themes catering to various audiences",
  question: question2
)

question2.correct_option = correct2
question2.save

correct3 = Option.create!(
  content: "Fiction and non-fiction",
  question: question3
)
Option.create!(
  content: "Mystery and suspense",
  question: question3
)
Option.create!(
  content: "Science fiction and fantasy",
  question: question3
)
Option.create!(
  content: "Romance and historical fiction",
  question: question3
)

question3.correct_option = correct3
question3.save


correct4 = Option.create!(
  content: "Dribbling, passing, and shooting techniques",
  question: question4
)
Option.create!(
  content: "Offensive and defensive tactics",
  question: question4
)
Option.create!(
  content: "Teamwork and communication on the court",
  question: question4
)
Option.create!(
  content: "Understanding the court dimensions and positions",
  question: question4
)

question4.correct_option = correct4
question4.save

question5 = Question.create!(
  title: "Which architectural style is characterized by a minimalistic approach, emphasizing clean lines and simplicity?",
  content: "Which architectural style is characterized by a minimalistic approach, emphasizing clean lines and simplicity?",
  interest: interest1
)

correct5 = Option.create!(
  content: "Gothic architecture",
  question: question5
)

Option.create!(
  content: "Neoclassical architecture",
  question: question5
)

Option.create!(
  content: "Modern architecture",
  question: question5
)

Option.create!(
  content: "Baroque architecture",
  question: question5
)

question5.correct_option = correct5
question5.save

question6 = Question.create!(
  title: "Who is known for designing the Fallingwater house, an iconic example of organic architecture?",
  content: "Who is known for designing the Fallingwater house, an iconic example of organic architecture?",
  interest: interest1
)

correct6 = Option.create!(
  content: "Frank Lloyd Wright",
  question: question6
)

Option.create!(
  content: "Le Corbusier",
  question: question6
)

Option.create!(
  content: "Ludwig Mies van der Rohe",
  question: question6
)

Option.create!(
  content: "Antoni Gaudí",
  question: question6
)

question6.correct_option = correct6
question6.save

question7 = Question.create!(
  title: "Which architect is famous for designing the Sydney Opera House",
  content: "Which architect is famous for designing the Sydney Opera House",
  interest: interest1
)

correct7 = Option.create!(
  content: "Zaha Hadid",
  question: question7
)

Option.create!(
  content: "I. M. Pei",
  question: question7
)

Option.create!(
  content: "Jørn Utzon",
  question: question7
)

Option.create!(
  content: "Louis Kahn",
  question: question7
)

question7.correct_option = correct7
question7.save

question8 = Question.create!(
  title: "The Colosseum in Rome is an example of which architectural style?",
  content: "The Colosseum in Rome is an example of which architectural style?",
  interest: interest1
)

correct8 = Option.create!(
  content: "Romanesque architecture",
  question: question8
)

Option.create!(
  content: "Renaissance architecture",
  question: question8
)

Option.create!(
  content: "Classical architecture",
  question: question8
)

Option.create!(
  content: "Gothic architecture",
  question: question8
)

question8.correct_option = correct8
question8.save

question9 = Question.create!(
  title: "Which architect is associated with the design of the Guggenheim Museum in Bilbao?",
  content: "Which architect is associated with the design of the Guggenheim Museum in Bilbao?",
  interest: interest1
)

correct9 = Option.create!(
  content: "Renzo Piano",
  question: question9
)

Option.create!(
  content: "Santiago Calatrava",
  question: question9
)

Option.create!(
  content: "Richard Meier",
  question: question9
)

Option.create!(
  content: "Frank Gehry",
  question: question9
)

question9.correct_option = correct9
question9.save

question10 = Question.create!(
  title: "Which architectural style is characterized by pointed arches, ribbed vaults, and flying buttresses?",
  content: "Which architectural style is characterized by pointed arches, ribbed vaults, and flying buttresses?",
  interest: interest1
)

correct10 = Option.create!(
  content: "Rococo architecture",
  question: question10
)

Option.create!(
  content: "Art Deco architecture",
  question: question10
)

Option.create!(
  content: "Baroque architecture",
  question: question10
)

Option.create!(
  content: "Gothic architecture",
  question: question10
)

question10.correct_option = correct10
question10.save
