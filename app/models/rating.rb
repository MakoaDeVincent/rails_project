class Rating < ApplicationRecord

    has_many :films
    has_many :users, through: :films

    validates :score, presence: true

end
