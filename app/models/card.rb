class Card < ApplicationRecord
  belongs_to :deck
  has_many :progress_log_details, dependent: :destroy
  validates :question, :answer, presence: true
end
