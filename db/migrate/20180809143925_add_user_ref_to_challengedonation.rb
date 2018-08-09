class AddUserRefToChallengedonation < ActiveRecord::Migration[5.2]
  def change
    add_reference :challenge_donations, :user, foreign_key: true
  end
end
