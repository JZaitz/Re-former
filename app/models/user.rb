class User < ApplicationRecord
    has_many :events
    validates :username,  presence: true, length: { minimum: 5, maximum: 15 },
                        uniqueness: true
    validates :email,     presence: true, length: { minimum: 8, maximum: 30 },
                        uniqueness: true
                        
    validates :password,  presence: true, length: { minimum: 5, maximum: 20 }
end
