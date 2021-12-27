class CalendarMember < ApplicationRecord
  belongs_to :member
  belongs_to :calendar
end
