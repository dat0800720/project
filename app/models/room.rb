class Room < ApplicationRecord
  has_many :calendars, dependent: :destroy
end
