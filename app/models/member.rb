class Member < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  has_one :booking, dependent: :destroy
  validates :email, uniqueness: true
  # validates_uniqueness_of :login
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def authenticate(email, password)
      member = find_by_email(email)
      if member && member.hashed_password.present? &&
         BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end
