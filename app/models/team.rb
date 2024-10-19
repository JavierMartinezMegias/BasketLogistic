class Team < ApplicationRecord
  has_many :players
  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  validates :name, presence: true
  validates :trainner, presence: true

  scope :ordered, -> { order(:name, :trainner) }
end
