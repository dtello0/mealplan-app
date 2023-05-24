# == Schema Information
#
# Table name: mealplans
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Mealplan < ApplicationRecord
  belongs_to :user
end
