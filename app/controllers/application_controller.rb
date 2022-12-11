class ApplicationController < ActionController::Base
#class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
    if (usercustomer_signed_in?)
        afteregcus_path
    else
        afteregexe_path
    end
end


end