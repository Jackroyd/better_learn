class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, :subject, :topic, :level, presence: true
  validates :subject, inclusion: { in: %w[science history maths] }
  validates :topic, inclusion: { in: %w[biology chemistry physics] }
  validates :level, inclusion: { in: %w[ks1 ks2 gcse] }
end
