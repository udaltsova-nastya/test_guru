# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  level       :integer          default(0), not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#

# :nodoc:
class Test < ApplicationRecord
  EASY_LEVELS = (0..1)
  MIDDLE_LEVELS = (2..4)
  HARD_LEVELS = (5..Float::INFINITY)

  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: "User"

  def self.by_category(title)
    Category.by_title(title).tests.order(title: :desc).pluck(:title)
  end
  scope :easy, -> { where(level: EASY_LEVELS) }
  scope :middle, -> { where(level: MIDDLE_LEVELS) }
  scope :hard, -> { where(level: HARD_LEVELS) }
  
  validates :title, presence: true
  validates :level, numericality: { greater_than: -1 }
  validates :title, uniqueness: { scope: :level }
end
