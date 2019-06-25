# frozen_string_literal: true

# :nodoc:
class Answer < ApplicationRecord
  belongs_to :question
end
