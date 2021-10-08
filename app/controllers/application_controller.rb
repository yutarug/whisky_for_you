class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        new_admin_bottle_path
     end
  
  
  
     #元に戻す
     def after_sign_out_path_for(resource)
        new_admin_session_path
     end
end
