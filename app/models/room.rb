class Room < ApplicationRecord
    validates_uniqueness_of :name
    scope :public_rooms, -> {where(is_private: false)}
    after_create_commit {broadcast_if_public }
    has_many :messages
    has_many :participants, dependent: :destroy

    def broadcast_if_public
        broadcast_append_to "rooms" unless self.is_private
    end

    def self.create_private_room(userexecutors,room_name)
        single_room = Room.create(name: room_name, is_private: true)
            userexecutors.each do |userexecutor|
                Participant.create(userexecutor_id: userexecutor.id, room_id:single_room.id)
            end
        single_room
    end

    def participant?(room, userexecutor)
        room.participants.where(userexecutor: userexecutor).exists?
        Participant.where(userexecutor_id: userexecutor.id, room_id: room.id).exists?
      end
end
