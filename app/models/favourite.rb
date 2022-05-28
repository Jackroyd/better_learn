class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :deck, dependent: :destroy
end
