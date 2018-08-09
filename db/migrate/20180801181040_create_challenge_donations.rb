class CreateChallengeDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_donations do |t|
      t.string :media
      t.string :city
      t.string :description
      t.float :lat
      t.float :lng
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
