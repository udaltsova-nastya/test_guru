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
  MAX_QUESTION_ANSWERS_COUNT = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :answers_count, on: :create

  private

  def answers_count
    return if question.answers_count >= MAX_QUESTION_ANSWERS_COUNT

    errors.add(:base, "There should be no more than #{MAX_QUESTION_ANSWERS_COUNT} answers to one question")
  end
end
