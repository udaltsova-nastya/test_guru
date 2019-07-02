# frozen_string_literal: true

# :nodoc:
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.by_category(title)
    Category.by_title(title).tests.order(title: :desc).pluck(:title)
  end
end
