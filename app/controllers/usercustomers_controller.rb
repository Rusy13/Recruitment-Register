class UsercustomersController < ApplicationController
  def show
    @usercustomer = Usercustomer.find(params[:id])
    @usercustomers = Usercustomer.all_except(current_usercustomer)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(@usercustomer,current_usercustomer)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@usercustomer, current_usercustomer], @room_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private
  def get_name(usercustomer1,usercustomer2)
    usercustomer = [usercustomer1,usercustomer2].sort 
    "private_#{usercustomer[0].id}_#{usercustomer[1].id}"
  end
end
