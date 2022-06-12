class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, :subject, :topic, :level, presence: true
  validates :subject, inclusion: { in: %w[science history maths] }
  validates :topic, inclusion: { in: %w[biology chemistry physics] }
  validates :level, inclusion: { in: %w[ks1 ks2 gcse] }
  validates :name, uniqueness: { scope: :user }
  accepts_nested_attributes_for :cards, allow_destroy: true, reject_if: :all_blank

  include PgSearch::Model
  pg_search_scope :decks_search,
    against: [ :name, :description],
    associated_against: {
      cards: [ :answer, :question ]
    },
    using: {
      tsearch: { prefix: true }
    }
    pg_search_scope :decks_filter,
    against: [ :subject, :level, :topic],
    using: {
      tsearch: { prefix: true }
    }
end
