class Request < ApplicationRecord
  belongs_to :member
  belongs_to :holiday

  private
  def create_request
    user = User.current
    self.member_id = user.member.id
    self.status = 0 if self.status.blank?
  end
end
