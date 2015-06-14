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

class Goldenword < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true
end
