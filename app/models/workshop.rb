class Workshop < ApplicationRecord
  validates :title, :description, :category, :skill_level, :location, presence: true

  belongs_to :user
  has_many :timeslots, dependent: :destroy
  has_one_attached :img
end
