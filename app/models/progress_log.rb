class ProgressLog < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  validates :correct, :incorrect, presence: true
end
