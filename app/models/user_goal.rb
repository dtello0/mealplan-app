# == Schema Information
#
# Table name: user_goals
#
#  id           :integer          not null, primary key
#  age          :string
#  gender       :text
#  height_in_cm :string
#  objective    :text
#  user         :text
#  weight_in_kg :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class UserGoal < ApplicationRecord
end
