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


require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
