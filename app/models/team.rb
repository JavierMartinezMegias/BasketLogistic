class Team < ApplicationRecord
  has_many :players

  validates :name, presence: true

  scope :ordered, -> { order(:name, :trainner) }
end
