class ChallengeDonation < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  validates_presence_of :media,:description
end
