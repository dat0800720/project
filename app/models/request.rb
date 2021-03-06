class Request < ApplicationRecord
  attr_accessor :approver_ids, :follower_ids, :button_draft
  belongs_to :member
  belongs_to :holiday
  has_many :member_requests, dependent: :destroy
  has_many :members, through: :member_requests
  has_many :break_times, dependent: :destroy
  accepts_nested_attributes_for :break_times, allow_destroy: true
  before_update :not_reject
  before_create :create_request
  after_save :sent_to_members
  before_save :check_button

  private

  def create_request
    self.request_status = 0 if self.request_status.blank?
  end

  def not_reject
    self.comment = "" if self.request_status != 3
  end

  def sent_to_members
    if self.approver_ids.present? && self.follower_ids.present?
      self.member_requests.destroy_all
      if self.approver_ids.reject{ |n| n.blank? }.blank? && self.request_status != 1
        errors.add(:approver_ids, "Vui lòng chọn tên người nhận thư")
        self.destroy
      else
        self.approver_ids.reject{ |n| n.blank? }.each do |approver_id|
          MemberRequest.create!(request_id: self.id, member_id: approver_id, type_recipient: 0)
        end
        self.follower_ids.reject{ |n| n.blank? }.each do |follower_id|
          MemberRequest.create!(request_id: self.id, member_id: follower_id, type_recipient: 1)
        end
      end
    end
  end

  def check_button
    self.request_status = 0 if self.button_draft.present? && self.button_draft.to_s == "submit"
    self.request_status = 0 if self.button_draft.present? && self.button_draft.to_s == "Gửi đơn từ"
    self.request_status = 1 if self.button_draft.present? && self.button_draft.to_s == "draft"
    self.request_status = 1 if self.button_draft.present? && self.button_draft.to_s == "Thêm vào tin nháp"
    self.request_status = 3 if self.button_draft.present? && self.button_draft.to_s == "reject"
    self.request_status = 3 if self.button_draft.present? && self.button_draft.to_s == "Từ chối đơn"
  end
end
