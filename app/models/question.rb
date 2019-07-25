# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  test_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# :nodoc:
class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  delegate :title, to: :test, prefix: true
end
