class Operation < ApplicationRecord
  belongs_to :user
  has_many :groupoperations
  has_many :groups, through: :groupoperations
end
