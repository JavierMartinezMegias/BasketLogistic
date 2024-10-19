class TrainingDay < ApplicationRecord

  scope :ordered, -> { order(training_date: :desc) }

  def t2_percentage
    (two_point_shots_scored * 100) / two_point_shots_totals
  end

  def t3_percentage
    (three_points_shots_scored * 100) / three_points_shots_totals
  end

  def tl_percentage
    (free_throws_scored * 100) / free_throws_totals
  end

end
