class LevelInfo < ActiveRecord::Base
  BASE_LEVEL_MULTIPLIER = 500

  belongs_to :user

  validates :level, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :current_exp, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def total_exp
    current_exp + (level - 1) * level / 2 * BASE_LEVEL_MULTIPLIER
  end

  def next_level_total_exp
    level * (level + 1) / 2 * BASE_LEVEL_MULTIPLIER
  end

  def next_level_exp
    level * LevelInfo::BASE_LEVEL_MULTIPLIER
  end

  def percent_complete
    100.0 * current_exp / next_level_exp
  end
end
