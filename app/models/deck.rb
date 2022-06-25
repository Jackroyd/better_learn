class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, :subject, :topic, :level, presence: true
  validates :subject, inclusion: { in: %w[science history maths] }
  validates :topic, inclusion: { in: %w[biology chemistry physics] }
  validates :level, inclusion: { in: %w[ks1 ks2 gcse] }
  validates :name, uniqueness: { scope: :user }
  MAX_RATING = 5

  validates :rating, numericality: { in: 0..MAX_RATING }
  accepts_nested_attributes_for :cards, allow_destroy: true, reject_if: :all_blank

  def self.by_sub_top_lev(subject = nil, topic = nil, level = nil)
    return where(subject: subject, topic: topic, level: level) if subject && topic && level
    return where(topic: topic, level: level) if topic && level
    return where(subject: subject, level: level) if subject && level
    return where(subject: subject, topic: topic) if subject && topic
    return where(subject: subject) if subject
    return where(topic: topic) if topic
    return where(level: level) if level

    all
  end

  include PgSearch::Model
  pg_search_scope :decks_search,
    against: [ :name, :description],
    associated_against: {
      cards: [ :answer, :question ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
