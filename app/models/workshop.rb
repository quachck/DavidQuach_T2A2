class Workshop < ApplicationRecord
  validates :title, :description, :price, :category, :skill_level, :location, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  has_many :timeslots
  has_one_attached :img
end
