class Challenge < ApplicationRecord
    has_many :challenge_donations, dependent: :destroy
    validates_presence_of :title, :media
end
