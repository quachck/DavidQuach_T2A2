class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workshops, dependent: :destroy
  # need to specify foreign key here or rails will assume it to be user_id
  has_many :sales, class_name: "Booking", dependent: :destroy, foreign_key: "instructor_id"
  has_many :purchases, class_name: "Booking", dependent: :destroy, foreign_key: "attendee_id"

  validates :first_name, :last_name, :number, presence: true
  validates :number, numericality: true

  def full_name 
    "#{first_name} #{last_name}"
  end
end
