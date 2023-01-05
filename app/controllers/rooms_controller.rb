class RoomsController < ApplicationController
  # before_action :authenticate_userexecutor!
  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @userexecutors = Userexecutor.all_except(current_userexecutor)
    @userexecutors = Userexecutor.all_except(current_userexecutor)
    @userexecutorse = Userexecutor.where(role: 'true')
    @userexecutorsc = Userexecutor.where(role: 'false')

    
    @usercustomers = Usercustomer.all_except(current_usercustomer)

    render 'index'
  end

  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @userexecutors = Userexecutor.all_except(current_userexecutor)
    @usercustomers = Usercustomer.all_except(current_usercustomer)
    @userexecutorse = Userexecutor.where(role: 'true')
    @userexecutorsc = Userexecutor.where(role: 'false')
    
    render 'index'
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end
  
end
