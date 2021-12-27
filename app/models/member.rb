class Member < ApplicationRecord
  belongs_to :user, optional: true
  has_many :member_requests, dependent: :destroy
  has_many :requests, through: :member_requests
  has_many :calendar_members, dependent: :destroy
  has_many :calendars, through: :calendar_members

  before_create :create_user
  VALID_PHONE_NUMBER_REGEX = /(84|0[2|3|5|7|8|9])+([0-9]{8})\b/
  validates :phone_number, length: {maximum: 11}, format:{with: VALID_PHONE_NUMBER_REGEX}, allow_blank: true
  validates :relatives_phone, length: {maximum: 11}, format:{with: VALID_PHONE_NUMBER_REGEX}, allow_blank: true

  validates :employee_code, presence: true, uniqueness: true
  VALID_BANK_ACCOUNT_REGEX = /\A\d+\Z/
  validates :identity_card, length: {maximum:13}, format:{with: VALID_BANK_ACCOUNT_REGEX}, allow_blank: true
  validates :bank_account, length: {maximum: 20}, format:{with: VALID_BANK_ACCOUNT_REGEX}, allow_blank: true

  private
  def create_user
    user = User.find_or_initialize_by(email: "#{self.employee_code}@rubyonring.com")
    if user.new_record?
      user.update(password: 123456, name: self.name)
      user.image.attach(io: File.open(File.join(Rails.root, "app/assets/images/user.png")), filename: "user.png")
    end
    self.user_id = user.id
  end

end
