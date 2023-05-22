class CreateUserGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :user_goals do |t|
      t.text :user
      t.text :objective
      t.string :weight_in_kg
      t.string :height_in_cm
      t.string :age
      t.text :gender

      t.timestamps
    end
  end
end
