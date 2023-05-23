# == Schema Information
#
# Table name: user_goals
#
#  id                :integer          not null, primary key
#  age               :decimal(, )
#  bmr               :decimal(, )
#  calorie_objective :decimal(, )
#  carbs_objective   :decimal(, )
#  fat_objective     :decimal(, )
#  gender            :text
#  height_in_cm      :decimal(, )
#  objective         :text
#  protein_objective :decimal(, )
#  weight_in_kg      :decimal(, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :text
#
class UserGoal < ApplicationRecord
  belongs_to :user
end
