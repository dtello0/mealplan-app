class SetupController < ApplicationController
  before_action(:force_user_sign_in)

  def initial_goals
    render({ :template => "goals/initial_screening.html.erb"})
  end 
  
  def calculate_calories
    @goal = UserGoal.new
    @goal.user_id = session.fetch(:user_id)
    @goal.objective = params.fetch("objective")
    
    if params.fetch("weight_unit") == "kg"
      @goal.weight_in_kg = params.fetch("weight").to_f
    else
      @goal.weight_in_kg = params.fetch("weight").to_f * 0.453592
    end

    if params.fetch("height_unit") == "cm"
      @goal.height_in_cm = params.fetch("height")
    else
      @goal.height_in_cm = params.fetch("height").to_f * 2.54
    end

    @goal.age = params.fetch("age")
    @goal.gender = params.fetch("gender")

    if @goal.gender == "man"
      @bmr = (88.362 + (13.397 * @goal.weight_in_kg) + (4.799 * @goal.height_in_cm) - (5.677 * @goal.age))*1.2
    else
      @bmr = (447.593 + (9.247 * @goal.weight_in_kg) + (3.098 * @goal.height_in_cm) - (4.330 * @goal.age))*1.2
    end

    @goal.bmr = @bmr

    if @goal.objective == "loss" 
      @goal.calorie_objective = @bmr * 0.9
    elsif @goal.objective == "maintenance"
      @goal.calorie_objective = @bmr
    elsif @goal.objective == "gain"
      @goal.calorie_objective = @bmr * 1.1
    end
    
    @goal.protein_objective = 1.8 * @goal.weight_in_kg
    @goal.fat_objective = 0.8 * @goal.weight_in_kg

    @goal.carbs_objective = (@goal.calorie_objective - @goal.protein_objective * 4 - @goal.fat_objective * 9)/4

    @goal.save
    render({ :template => "goals/objectives_summary.html.erb"})

  end

end
