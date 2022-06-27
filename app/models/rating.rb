class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  validates :score, presence: true, inclusion: { in: 1..5 }
end
