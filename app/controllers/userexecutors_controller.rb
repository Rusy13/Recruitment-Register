class UserexecutorsController < ApplicationController
  def show
    @userexecutor = Userexecutor.find(params[:id])
    @userexecutors = Userexecutor.all_except(current_userexecutor)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(@userexecutor,current_userexecutor)

    if (current_userexecutor.role == true)
      redirect_to '/ru/rooms' and return unless @userexecutor.role == true
    elsif (current_userexecutor.role == false)
      redirect_to '/ru/rooms' and return if @userexecutor.role == false
    end
    
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@userexecutor, current_userexecutor], @room_name)
    
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private
  def get_name(userexecutor1,userexecutor2)
    userexecutor = [userexecutor1,userexecutor2].sort 
    "private_#{userexecutor[0].id}_#{userexecutor[1].id}"
  end
end
