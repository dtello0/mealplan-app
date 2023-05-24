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

  def lastplan
    the_user = session.fetch(:user_id)
    
    lastplan = Mealplan.where({ :user_id => the_user }).order(submitted_at: :desc).first

    return lastplan.id
  end

end
