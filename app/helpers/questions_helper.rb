# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    test_title = question.test_title
    if question.persisted?
      "Edit #{test_title} Question"
    else
      "Create New #{test_title} Question"
    end
  end
end
