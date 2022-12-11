class OpenController < ApplicationController
    def after_registrationcus
        @userscus = Usercustomer.all
    end
    
    def after_registrationexe
        @usersexe = Userexecutor.all
    end
end
