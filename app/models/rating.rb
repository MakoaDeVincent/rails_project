class Rating < ApplicationRecord

    has_many :films
    has_mant :users, through: :films

    validates :score, presence: true

end
