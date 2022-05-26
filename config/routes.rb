Rails.application.routes.draw do



  # Routes for the Small business resource:

  # CREATE
  post("/insert_small_business", { :controller => "small_businesses", :action => "create" })
          
  # READ
  get("/small_businesses", { :controller => "small_businesses", :action => "index" })
  
  get("/small_businesses/:path_id", { :controller => "small_businesses", :action => "show" })
  
  # UPDATE
  
  post("/modify_small_business/:path_id", { :controller => "small_businesses", :action => "update" })
  
  # DELETE
  get("/delete_small_business/:path_id", { :controller => "small_businesses", :action => "destroy" })

  #------------------------------

  # Routes for the Offer resource:

  # CREATE
  post("/insert_offer", { :controller => "offers", :action => "create" })
          
  # READ
  get("/offers", { :controller => "offers", :action => "index" })
  
  get("/offers/:path_id", { :controller => "offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_offer/:path_id", { :controller => "offers", :action => "update" })
  
  # DELETE
  get("/delete_offer/:path_id", { :controller => "offers", :action => "destroy" })

  #------------------------------

  # Routes for the Users leveraging accepted offer resource:

  # CREATE
  post("/insert_users_leveraging_accepted_offer", { :controller => "users_leveraging_accepted_offers", :action => "create" })
          
  # READ
  get("/users_leveraging_accepted_offers", { :controller => "users_leveraging_accepted_offers", :action => "index" })
  
  get("/users_leveraging_accepted_offers/:path_id", { :controller => "users_leveraging_accepted_offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_users_leveraging_accepted_offer/:path_id", { :controller => "users_leveraging_accepted_offers", :action => "update" })
  
  # DELETE
  get("/delete_users_leveraging_accepted_offer/:path_id", { :controller => "users_leveraging_accepted_offers", :action => "destroy" })

  #------------------------------

  # Routes for the Accepted offer resource:

  # CREATE
  post("/insert_accepted_offer", { :controller => "accepted_offers", :action => "create" })
          
  # READ
  get("/accepted_offers", { :controller => "accepted_offers", :action => "index" })
  
  get("/accepted_offers/:path_id", { :controller => "accepted_offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_accepted_offer/:path_id", { :controller => "accepted_offers", :action => "update" })
  
  # DELETE
  get("/delete_accepted_offer/:path_id", { :controller => "accepted_offers", :action => "destroy" })

  #------------------------------

  # Routes for the Company resource:

  # CREATE
  post("/insert_company", { :controller => "companies", :action => "create" })
          
  # READ
  get("/companies", { :controller => "companies", :action => "index" })
  
  get("/companies/:path_id", { :controller => "companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_company/:path_id", { :controller => "companies", :action => "update" })
  
  # DELETE
  get("/delete_company/:path_id", { :controller => "companies", :action => "destroy" })

  #------------------------------

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
