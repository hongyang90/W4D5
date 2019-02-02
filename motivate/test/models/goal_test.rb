# == Schema Information
#
# Table name: goals
#
#  id          :bigint(8)        not null, primary key
#  description :text             not null
#  user_id     :integer          not null
#  comment_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
