# frozen_string_literal: true

# :nodoc:
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: "User"

  def self.by_category(title)
    Category.by_title(title).tests.order(title: :desc).pluck(:title)
  end
end
