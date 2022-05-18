class Workshop < ApplicationRecord
  validates :title, :description, :category, :skill_level, :location, presence: true
  # validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  has_many :timeslots, dependent: :destroy
  has_one_attached :img
end
