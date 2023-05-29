
@interests.each do |interest|
questions = interest.questions # all the questions / intrest
    total_questions = 0
    answered = 0
    questions.each do |question|
      total_questions += question.challenges.count
      question.challenges.each do |challenge|
        answered += 1 if challenge.corrected
      end
    end
  end
  answered_ratio = (answered.to_f / total_questions) * 100
  result = answered_ratio.round(2)
