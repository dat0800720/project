class BreakTime < ApplicationRecord
  belongs_to :request

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_end_check
  # validate :overlap_check

  def start_end_check
    errors.add(:end_time, "Vui lòng chọn thời gian muộn hơn thời gian bắt đầu") if self.start_time.to_f > self.end_time.to_f
  end

  def overlap_check
    overlaps = BreakTime.joins(:request).where(requests: { member_id: User.current.member.id}).where(day: self.day).where('start_time <= ? AND end_time >= ?', end_time, start_time)
    errors.add(:errors, "Thời gian xin nghỉ của bạn bị chồng lên nhau") if (overlaps.size > 1) || (overlaps.count == 1 && overlaps.first.id == id)
  end
end
