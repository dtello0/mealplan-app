class MealplanController < ApplicationController

  before_action(:force_user_sign_in)
  
  def welcome
    @user_last_goal = UserGoal.where(user_id: session[:user_id]).order(submitted_at: :desc).first
    render({ :template => "mealplan/welcome.html.erb"})
  end

  def new_mealplan
    
    require "openai"

    @user_last_goal = UserGoal.where(user_id: session[:user_id]).order(submitted_at: :desc).first
    protein_objective = @user_last_goal.protein_objective
    carbs_objective = @user_last_goal.carbs_objective
    fat_objective = @user_last_goal.fat_objective

    api_messages_array = [
      { role: "system", content: "You are a meal planning assistant." },
      { role: "user", content: "Please provide a meal plan in JSON format with the struture meal, food_item, ingredients, macros, for Breakfast, First snack, Lunch, Second snack, and Dinner, based on the following objectives: Protein: #{protein_objective} g Carbs: #{carbs_objective} g Fat: #{fat_objective} g" }
    ]
   
    client = OpenAI::Client.new(access_token: ENV.fetch("GPT_TOKEN"), request_timeout: 240)
    
    response = client.chat(
      parameters: {
            model: "gpt-4",
            messages: api_messages_array,
            temperature: 1.0,
        }
      )

    meal_plan_content = response.fetch("choices").at(0).fetch("message").fetch("content")

    @meal_plan = Mealplan.new
    @meal_plan.user_id = session.fetch(:user_id)
    @meal_plan.content = meal_plan_content

    if @meal_plan.save
      @meal_plan.save
      redirect_to("/mealplans/#{@meal_plan.id}", { :notice => "Meal plan created successfully." })
    else
      redirect_to("/home", { :alert => meal_plan.errors.full_messages.to_sentence })
    end

  end

end
