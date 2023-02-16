class Operation < ApplicationRecord
  belongs_to :user
  has_many :groupoperations
  has_many :groups, through: :groupoperations

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
