class CreateMealplans < ActiveRecord::Migration[6.0]
  def change
    create_table :mealplans do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
