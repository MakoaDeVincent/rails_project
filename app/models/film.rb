class Film < ApplicationRecord

    belongs_to :user
    belongs_to :rating
    has_many :users, through: :ratings

    #add a scope

    validates :name, :iso, presence: true
    
    
end
