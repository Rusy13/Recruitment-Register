class ApplicationController < ActionController::Base
    #class ApplicationController < ActionController::Base
    before_action :set_locale
    
    def after_sign_in_path_for(resource)
        if (usercustomer_signed_in?)
            afteregcus_path
        else
            afteregexe_path
        end
    end
    
    private

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
        {locale: I18n.locale}.merge options
    end
    
    end