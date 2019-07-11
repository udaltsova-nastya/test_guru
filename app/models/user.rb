# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test", foreign_key: :author_id

  def find_tests_by_level(level)
    tests.where(level: level)
  end
end
