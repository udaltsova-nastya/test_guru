# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# :nodoc:
class Category < ApplicationRecord
  has_many :tests

  scope :by_title, ->(title) { find_by(title: title) }

  validates :title, presence: true
end
