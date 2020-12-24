class Film < ApplicationRecord

    belongs_to :user
    belongs_to :rating
    has_many :users, through: :ratings

    #add a scope

    validates :name, :iso, presence: true
    
    def rating_attributes=(attributes)
        rating = Rating.find_or_create_by(attributes)
        self.rating = rating if rating.valid? || !self.rating
    end
    
end
