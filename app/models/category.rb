# frozen_string_literal: true

# :nodoc:
class Category < ApplicationRecord
  has_many :tests
end
