class User < ApplicationRecord
  has_secure_password
  before_save :email_downcase
  has_many :pdfs
  
  
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 140 }, uniqueness: true
  
  private
    def email_downcase
      self.email = email.downcase
    end
end
