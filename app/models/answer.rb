# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text             not null
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  correct     :boolean          default(FALSE)
#

# :nodoc:
class Answer < ApplicationRecord
  QUESTION_ANSWERS_COUNT = (1..4)

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :question_answers_count

  private

  def question_answers_count
    return if QUESTION_ANSWERS_COUNT.include?(question.answers.count)
    errors.add(:base, "There should be 1 to 4 answers to one question")
  end
end
