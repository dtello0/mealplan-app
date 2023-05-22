class SetupController < ApplicationController

  def initial_goals
    render({ :template => "goals/initial_screening.html.erb"})
  end 
  
  

end
