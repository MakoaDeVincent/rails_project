class Film < ApplicationRecord

    #belongs_to :user
    #belongs_to :rating
    #has_many :users, through: :ratings

    validates :name, :iso, presence: true
    
end
