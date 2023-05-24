class Interest < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :options, through: :options

  # after_save :generate_questions

  def generate_questions
    # create question
    interest = self.name
    prompt = <<~PROMPT

    Generate 2 multiple-choice questions for the interest "#{interest}" as a JSON, where content is a description of the question and the first option is always the correct answer:
    [{
      title: "title",
      content: "content",
      options: ["option 1", "option 2", "option 3", "option 4"]
    }]
    PROMPT

    response = OpenaiService.new(prompt).call
    formatted_response = JSON.parse(response)
    # Iterate over the array of hashes
    formatted_response.each do |hash|
      # Create a new Question instance using the title and content
      question = Question.create(title: hash["title"], content: hash["content"], interest_id: self.id)
      # Create Option instances for each option in the options array
      hash["options"].each do |option_content|
        Option.create(content: option_content, question_id: question.id)
      end
      question.correct_option = question.options.first
      question.save
    end
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
