class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workshops, dependent: :destroy
  has_many :sales, class_name: "Booking", dependent: :destroy, foreign_key: "instructor_id"
  has_many :purchases, class_name: "Booking", dependent: :destroy, foreign_key: "attendee_id"
  
end
