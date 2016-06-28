class Identity < ActiveRecord::Base
  has_secure_password validations: true

  has_many :images
  
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, if: -> r { r.password.present? }
end
