class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, :subject, :level, presence: true
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

  pg_search_scope :filter_search,
    against: [ :subject, :level],
    using: {
      tsearch: { prefix: true }
    }

end
