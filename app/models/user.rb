class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :operations

  validates :name, presence: true, length: { maximum: 25 }
  validates :surname, presence: true, length: { maximum: 25 }
end
