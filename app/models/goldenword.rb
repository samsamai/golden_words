class Goldenword < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true
end
