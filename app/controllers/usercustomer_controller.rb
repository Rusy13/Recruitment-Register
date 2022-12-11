class UsercustomerController < ApplicationController
    def after_registrationcus
        @userscus = Usercustomer.all
    end
end