class User < ApplicationRecord
    has_many :articles
    validates :username, presence: true, length: { maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,
    presence: true, length: { maximum: 105 }, uniqueness: true,
    format: { with: VALID_EMAIL_REGEX}

end