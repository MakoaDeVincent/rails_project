class User < ApplicationRecord

    has_many :films
    has_many :ratings, through :films

    has_secure_password
    
    validates :name, :email, presence: true, uniqueness: true

end
