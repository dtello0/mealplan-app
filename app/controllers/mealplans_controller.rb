class MealplansController < ApplicationController

  before_action(:force_user_sign_in)
  
  def index
    matching_mealplans = Mealplan.all

    @list_of_mealplans = matching_mealplans.order({ :created_at => :desc })

    render({ :template => "mealplans/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_mealplans = Mealplan.where({ :id => the_id })

    @the_mealplan = matching_mealplans.at(0)

    @user_last_goal = UserGoal.where(user_id: session[:user_id]).order(submitted_at: :desc).first

    render({ :template => "mealplans/show.html.erb" })
  end

  def create
    the_mealplan = Mealplan.new
    the_mealplan.user_id = params.fetch("query_user_id")
    the_mealplan.content = params.fetch("query_content")

    if the_mealplan.valid?
      the_mealplan.save
      redirect_to("/mealplans", { :notice => "Mealplan created successfully." })
    else
      redirect_to("/mealplans", { :alert => the_mealplan.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_mealplan = Mealplan.where({ :id => the_id }).at(0)

    the_mealplan.user_id = params.fetch("query_user_id")
    the_mealplan.content = params.fetch("query_content")

    if the_mealplan.valid?
      the_mealplan.save
      redirect_to("/mealplans/#{the_mealplan.id}", { :notice => "Mealplan updated successfully."} )
    else
      redirect_to("/mealplans/#{the_mealplan.id}", { :alert => the_mealplan.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_mealplan = Mealplan.where({ :id => the_id }).at(0)

    the_mealplan.destroy

    redirect_to("/mealplans", { :notice => "Mealplan deleted successfully."} )
  end
end
