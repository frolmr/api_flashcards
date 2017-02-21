class Card < ApplicationRecord
  belongs_to :user
  validates :original_text, :translated_text, presence: true
end
