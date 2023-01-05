class Message < ApplicationRecord
  belongs_to :userexecutor
  belongs_to :userexecutor

  belongs_to :room
  after_create_commit{broadcast_append_to room}
  before_create :confirm_partificant

  validates :body, presence: { message: 'не может быть пустым' }

  def confirm_partificant
    return unless room.is_private

    # if userexecutor_signed_in?
      is_participant = Participant.where(userexecutor_id: userexecutor.id, room_id: room.id).first
    # else
      # is_participant = Participant.where(usercustomer_id: usercustomer.id, room_id: room.id).first
    # end

    throw :abort unless is_participant  
  end
end