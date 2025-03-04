Rails.application.routes.draw do
  # Routes for the Language proficiency resource:

  # CREATE
  post("/insert_language_proficiency", { :controller => "language_proficiencies", :action => "create" })
          
  # READ
  get("/language_proficiencies", { :controller => "language_proficiencies", :action => "index" })
  
  get("/language_proficiencies/:path_id", { :controller => "language_proficiencies", :action => "show" })
  
  # UPDATE
  
  post("/modify_language_proficiency/:path_id", { :controller => "language_proficiencies", :action => "update" })
  
  # DELETE
  get("/delete_language_proficiency/:path_id", { :controller => "language_proficiencies", :action => "destroy" })

  #------------------------------

  # Routes for the Availability resource:

  # CREATE
  post("/insert_availability", { :controller => "availabilities", :action => "create" })
          
  # READ
  get("/availabilities", { :controller => "availabilities", :action => "index" })
  
  get("/availabilities/:path_id", { :controller => "availabilities", :action => "show" })
  
  # UPDATE
  
  post("/modify_availability/:path_id", { :controller => "availabilities", :action => "update" })
  
  # DELETE
  get("/delete_availability/:path_id", { :controller => "availabilities", :action => "destroy" })

  #------------------------------

  # Routes for the Language resource:

  # CREATE
  post("/insert_language", { :controller => "languages", :action => "create" })
          
  # READ
  get("/languages", { :controller => "languages", :action => "index" })
  
  get("/languages/:path_id", { :controller => "languages", :action => "show" })
  
  # UPDATE
  
  post("/modify_language/:path_id", { :controller => "languages", :action => "update" })
  
  # DELETE
  get("/delete_language/:path_id", { :controller => "languages", :action => "destroy" })

  #------------------------------

  # Routes for the Session resource:

  # CREATE
  post("/insert_session", { :controller => "sessions", :action => "create" })
          
  # READ
  get("/sessions", { :controller => "sessions", :action => "index" })
  
  get("/sessions/:path_id", { :controller => "sessions", :action => "show" })
  
  # UPDATE
  
  post("/modify_session/:path_id", { :controller => "sessions", :action => "update" })
  
  # DELETE
  get("/delete_session/:path_id", { :controller => "sessions", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  root "pages#first"
end
