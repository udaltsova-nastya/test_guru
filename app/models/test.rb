# frozen_string_literal: true

# :nodoc:
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
end
