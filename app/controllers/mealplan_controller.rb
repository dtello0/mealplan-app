class MealplanController < ApplicationController

  def homepage
    @user_last_goal = UserGoal.where(user_id: session[:user_id]).order(submitted_at: :desc).first
    render({ :template => "mealplan/homepage.html.erb"})
  end

end
