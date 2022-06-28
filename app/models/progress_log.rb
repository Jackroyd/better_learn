class ProgressLog < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :progress_log_details, dependent: :destroy
  has_many :cards, through: :progress_log_details
  # validates :correct, :incorrect, presence: true
end
