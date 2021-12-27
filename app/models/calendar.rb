class Calendar < ApplicationRecord
  belongs_to :room
  has_many :calendar_members, dependent: :destroy
  has_many :members, through: :calendar_members
  scope :order_by_start_time, -> { order(start_time: :desc) }
end
