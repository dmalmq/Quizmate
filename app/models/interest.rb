class Interest < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :options, through: :options

  # after_save :generate_questions

  def generate_questions
    # create question
    interest = self.name
    question_prompt = "Generate a question with a title and content, which will be the question, for #{interest} in the form of {title: , content: , interest_id: #{self.id}} as a json. The interest is hard coded"
    question_response = OpenaiService.new(question_prompt).call
    question_hash = JSON.parse(question_response)
    question = Question.create(question_hash)

    # create options
    options_prompt = "Generate a suitable amount of multiple choice answers for this question: #{question.title} in the form of {content: , question_id: #{question.id}} as a JSON. The first option should be the only correct one. The question_id is hard coded."
    options_response = OpenaiService.new(options_prompt).call # returns this: [{ content: "A", question_id: @question.id }, { content: "A", question_id: @question.id }]
    options_hashes = JSON.parse(options_response)
    Option.create(options_hashes) # array of option instances
    question.correct_option = question.options.first
    question.save
    raise
  end
end
