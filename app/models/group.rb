class Group < ApplicationRecord
  belongs_to :user
  has_many :groupoperations
  has_many :operations, through: :groupoperations
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 30 }

  def total_amount(id)
    total_amount = 0
    @opers = Groupoperation.where(group_id: id).includes([:operation])
    @opers.each do |oper|
      total_amount += oper.operation.amount
    end
    total_amount
  end
end
