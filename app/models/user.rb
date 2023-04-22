class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_FORMAT = /\A
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  has_many :attached_files, dependent: :destroy

  validates :email, length: { maximum: 15 }
  validates :password,
    length: { in: 8..30 },
    format: { with: PASSWORD_FORMAT, message: "должен содержать буквы, цифры, и спецсимволы!" },
    confirmation: true
  validates :password_confirmation, presence: true
end
