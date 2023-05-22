class UserGoalsController < ApplicationController
  def index
    matching_user_goals = UserGoal.all

    @list_of_user_goals = matching_user_goals.order({ :created_at => :desc })

    render({ :template => "user_goals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_goals = UserGoal.where({ :id => the_id })

    @the_user_goal = matching_user_goals.at(0)

    render({ :template => "user_goals/show.html.erb" })
  end

  def create
    the_user_goal = UserGoal.new
    the_user_goal.objective = params.fetch("query_objective")
    the_user_goal.weight = params.fetch("query_weight")
    the_user_goal.in = params.fetch("query_in")
    the_user_goal.kg = params.fetch("query_kg")
    the_user_goal.height = params.fetch("query_height")
    the_user_goal.in = params.fetch("query_in")
    the_user_goal.cm = params.fetch("query_cm")
    the_user_goal.age = params.fetch("query_age")
    the_user_goal.gender = params.fetch("query_gender")

    if the_user_goal.valid?
      the_user_goal.save
      redirect_to("/user_goals", { :notice => "User goal created successfully." })
    else
      redirect_to("/user_goals", { :alert => the_user_goal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_goal = UserGoal.where({ :id => the_id }).at(0)

    the_user_goal.objective = params.fetch("query_objective")
    the_user_goal.weight = params.fetch("query_weight")
    the_user_goal.in = params.fetch("query_in")
    the_user_goal.kg = params.fetch("query_kg")
    the_user_goal.height = params.fetch("query_height")
    the_user_goal.in = params.fetch("query_in")
    the_user_goal.cm = params.fetch("query_cm")
    the_user_goal.age = params.fetch("query_age")
    the_user_goal.gender = params.fetch("query_gender")

    if the_user_goal.valid?
      the_user_goal.save
      redirect_to("/user_goals/#{the_user_goal.id}", { :notice => "User goal updated successfully."} )
    else
      redirect_to("/user_goals/#{the_user_goal.id}", { :alert => the_user_goal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_goal = UserGoal.where({ :id => the_id }).at(0)

    the_user_goal.destroy

    redirect_to("/user_goals", { :notice => "User goal deleted successfully."} )
  end
end
