class FakeJob < ApplicationJob
  queue_as :default

  def perform(interest)
    prompt = <<~PROMPT

    Generate 10 medium difficult multiple-choice questions for the interest "#{interest.name}" as a JSON, where content is a elaboration of the answer and the first option is always the correct answer:
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
      question = Question.create(title: hash["title"], content: hash["content"], interest_id: interest.id)
      # Create Option instances for each option in the options array
      hash["options"].each do |option_content|
        Option.create(content: option_content, question_id: question.id)
      end
      question.correct_option = question.options.first
      question.save
    end
  end
end
