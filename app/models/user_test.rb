# frozen_string_literal: true

# == Schema Information
#
# Table name: user_tests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  test_id     :integer
#  finished_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


##
# @example
# nastya = User.find_by(name: "Nastya")
# UserTest.create(finished_at: 1.day.ago, user: nastya, test: Test.find(4))
# OR
# UserTest.create(finished_at: 1.day.ago, user_id: nastya.id, test: Category.find_by(name: "Cats").tests.first)
# OR
# nastya.user_tests.create(test_id: Test.find(4).id)
class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
