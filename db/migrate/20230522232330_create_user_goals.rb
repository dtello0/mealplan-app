class CreateUserGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :user_goals do |t|
      t.text :user_id
      t.text :objective
      t.decimal :weight_in_kg
      t.decimal :height_in_cm
      t.numeric :age
      t.text :gender
      t.decimal :bmr
      t.decimal :calorie_objective
      t.decimal :protein_objective
      t.decimal :carbs_objective
      t.decimal :fat_objective

      t.timestamps
    end
  end
end
