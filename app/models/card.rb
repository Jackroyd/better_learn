class Card < ApplicationRecord
  belongs_to :deck
  validates :question, :answer, presence: true
end
