class OpenController < ApplicationController
  before_action :authenticate_userexecutor!
  before_action :addinfocus, only: [:edit, :update]


 def show
  @userscus = Usercustomer.all
  @usersexe1 = Userexecutor.all
  # @usersexe11 = Usercustomer.find(params[:id])
  @one = params[:one]
 end

  def after_registrationexe
      @userscus = Usercustomer.all
      @usersexe1 = Userexecutor.all
      @users = Userexecutor.all_except(current_userexecutor).search(params)
      @users2 = Userexecutor.all_except(current_userexecutor).search2(params)
      @users3 = Userexecutor.all_except(current_userexecutor).search3(params)
      @users4 = Userexecutor.all_except(current_userexecutor).search4(params)
      @one = params[:one]
      # @usersexe11 = Usercustomer.find(params[:one])
  end
  
  def after_registrationcus
      @usersexe = Userexecutor.all
      @userscus1 = Usercustomer.all
  end
  
  def addinfocus
    @userscusinfofullname = Usercustomer.find_by(email: current_usercustomer.email)
    @userscusinfofullname.update(full_name: params[:name1])

    @userscusinfoinn = Usercustomer.find_by(email: current_usercustomer.email)
    @userscusinfoinn.update(inn: params[:inn1])

    @userscusinfonumber = Usercustomer.find_by(email: current_usercustomer.email)
    @userscusinfonumber.update(number: params[:number1])

    @userscusinfowebsite = Usercustomer.find_by(email: current_usercustomer.email)
    @userscusinfowebsite.update(website: params[:website1])
  end


  def addinfoexe
    @usersexeinfofullname = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfofullname.update(full_name: params[:name1])

    @usersexeinfoinn = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfoinn.update(inn: params[:inn1])

    @usersexeinfonumber = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfonumber.update(number: params[:number1])

    @usersexeinfowebsite = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfowebsite.update(website: params[:website1])
      
    @usersexeinforole = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinforole.update(role: params[:role1])

  end




  def addexecutorreq
    # @arrdate = Array.new
    # @perem = current_userexecutor.free_date
    # @arrdate.push(@perem.to_s)
    # @startdd = params[:date1]
    # @arrdate.push(@startdd)


    @usersexeinfodate = Userexecutor.find_by(email: current_userexecutor.email)
    # @usersexeinfodate.update(free_date: (@arrdate).map{|date| date.to_s})
    @usersexeinfodate.update(free_date: params[:date1])


    @usersexeinfofee = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfofee.update(fee: params[:fee1])

    @usersexeinfofee = Userexecutor.find_by(email: current_userexecutor.email)
    @usersexeinfofee.update(category: params[:category1])
      
  end

  



end
