class User < ApplicationRecord
    # before_save { self.email = email.downcase }
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 200 }, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    # 添加 安全验证
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? 
                        BCrypt::Engine::MIN_COST :
                        BCrypt::Engine.cost

        BCrypt::Password.create(string, cost: cost)
    end
end
