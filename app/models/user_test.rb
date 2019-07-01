# frozen_string_literal: true

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
