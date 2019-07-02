# frozen_string_literal: true

# :nodoc:
class Category < ApplicationRecord
  has_many :tests

  scope :by_title, -> (title) { find_by(title: title) }
end
