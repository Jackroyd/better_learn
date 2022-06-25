class Card < ApplicationRecord
  belongs_to :deck
  has_many :progress_log_details
  validates :question, :answer, presence: true
end
