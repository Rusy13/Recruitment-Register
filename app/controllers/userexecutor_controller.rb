class UserexecutorController < ApplicationController
    def after_registrationexe
        @usersexe = Userexecutor.all
    end
end