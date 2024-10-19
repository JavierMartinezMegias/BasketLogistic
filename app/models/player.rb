class Player < ApplicationRecord
  POSITION = %i[ center power_forward small_foreward shooting_guard point_guard ]
  has_many :training_days

  scope :ordered, -> { order(:name, :team_id) }

end
