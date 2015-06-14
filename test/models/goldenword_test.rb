# == Schema Information
#
# Table name: goldenwords
#
#  id         :integer          not null, primary key
#  text       :string
#  correct    :integer          default(0)
#  wrong      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GoldenwordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should respond to attributes" do
    goldenword = Goldenword.new()
    assert_respond_to goldenword, :text
    assert_respond_to goldenword, :correct
    assert_respond_to goldenword, :wrong
    assert_respond_to goldenword, :bg_colour_hex
  end

end
