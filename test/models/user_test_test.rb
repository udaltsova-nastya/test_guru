# == Schema Information
#
# Table name: user_tests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  test_id     :integer
#  finished_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserTestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
