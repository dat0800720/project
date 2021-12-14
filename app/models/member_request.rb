class MemberRequest < ApplicationRecord
  belongs_to :request
  belongs_to :member
  scope :approver, -> {where type_recipient: 0}
  scope :follower, -> {where type_recipient: 1}
end
