class Interest < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions
  has_many :challenges, through: :questions
  validates :name, presence: true
  after_create :generate_questions

  def generate_questions
    FakeJob.perform_later(self)
  end

  # response = OpenaiService.new(prompt).call
  # formatted_response = JSON.parse(response)
  # # Iterate over the array of hashes
  # formatted_response.each do |hash|
  #   options = hash["options"].shuffle
  #   # Create a new Question instance using the title and content
  #   question = Question.create(title: hash["title"], content: hash["content"], interest_id: self.id)
  #   # Create Option instances for each option in the options array
  #   options.each do |option_content|
  #     Option.create(content: option_content, question_id: question.id)
  #   end
  #   correct_option = options.index(hash["options"].first)
  #   question.correct_option = question.options[correct_option]
  #   question.save
  # end

  def corrected_percentage
    @total_challenges = challenges.count
    @answered = challenges.where(corrected: true).count
    ((@answered.to_f / @total_challenges) * 100).round(2)
  end
end

# openai response:
# data = [
#   {
#     title: "title",
#     content: "content",
#     options: ["option 1", "option 2", "option 3", "option 4"]
#   },
#   {
#     title: "title",
#     content: "content",
#     options: ["option 1", "option 2", "option 3", "option 4"]
#   }
# ]
