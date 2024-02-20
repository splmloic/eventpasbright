class Event < ApplicationRecord
  validates :start_date, presence: true
  validate do
    errors.add(:start_date, "ne peut pas être dans le passé") if start_date && start_date < Time.now
  end
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
  validate do
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id', optional: true
end
