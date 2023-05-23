Rails.application.routes.draw do

  
  # Routes for the User goal resource:

  # CREATE
  post("/insert_user_goal", { :controller => "user_goals", :action => "create" })
          
  # READ
  get("/user_goals", { :controller => "user_goals", :action => "index" })
  
  get("/user_goals/:path_id", { :controller => "user_goals", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_goal/:path_id", { :controller => "user_goals", :action => "update" })
  
  # DELETE
  get("/delete_user_goal/:path_id", { :controller => "user_goals", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "user_authentication", :action => "sign_up_form" })
  get("/your_goals", { :controller => "setup", :action => "initial_goals"})
  get("/calculate_calories_form", { :controller => "setup", :action => "calculate_calories" })
  post("/calculate_calories", { :controller => "setup", :action => "calculate_calories"})

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
