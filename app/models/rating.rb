class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :deck, dependent: :destroy
  validates :rating, presence: true
end
