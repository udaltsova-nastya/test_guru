# frozen_string_literal: true

# :nodoc:
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.by_category(title)
    Category.find_by(title: title).tests
  end
end
