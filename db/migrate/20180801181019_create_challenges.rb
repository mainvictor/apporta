class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :media

      t.timestamps
    end
  end
end
