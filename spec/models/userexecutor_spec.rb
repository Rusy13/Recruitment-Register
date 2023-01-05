# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Userexecutor, type: :model do
  let(:email_userexecutor) { 'OOO@gmail.ru' }
  let(:password_userexecutor) { '111111' }

  describe 'Manipulating with model User' do
    it 'create User and check valid' do
      user = Userexecutor.create(email: email_userexecutor, password: password_userexecutor, password_confirmation: password_userexecutor)
      expect(user).to be_valid
    end

    it 'create User and check invalid' do
      user = Userexecutor.create(email: email_userexecutor, password: password_userexecutor, password_confirmation: "#{password_userexecutor}1")
      expect(user).to be_invalid
    end

    it 'create new User without params and try to save it' do
      expect(Userexecutor.create.save).to be_falsey
    end

    it 'create new User and try to find it' do
      user = Userexecutor.create(email: email_userexecutor, password: password_userexecutor, password_confirmation: password_userexecutor)
      expect(Userexecutor.find_by(email: user.email)).to eq(user)
    end

    it 'create new User and try to find it by id' do
      user = Userexecutor.create(email: email_userexecutor, password: password_userexecutor, password_confirmation: password_userexecutor)
      expect(Userexecutor.find_by(id: user.id)).to eq(user)
    end
  end


  describe 'Manipulating with rooms' do
    let(:user1) do
      Userexecutor.create(email: 'oleg-nsk@mail.ru', password: 'ts6GwTyLCzEYNmG', password_confirmation: 'ts6GwTyLCzEYNmG',
                  full_name: 'Ivan Pogiba')
    end
    let(:user2) do
      Userexecutor.create(email: 'pogibuskaivan@gmail.com', password: 'ts6GwTyLCzEYNmG', password_confirmation: 'ts6GwTyLCzEYNmG',
                  full_name: 'Oleg Pogiba')
    end
    let(:room) { Room.create(name: 'room1') }

    it 'create private room and check if users are participants' do
      private_room = Room.create_private_room([user1, user2], 'room1')
      expect(private_room.participant?(private_room, user1)).to be_truthy
      expect(private_room.participant?(private_room, user2)).to be_truthy
    end

    it 'create private room and check if users are not participants' do
      user3 = Userexecutor.create(email: 'pogiba@yandex.ru', password: '123456', password_confirmation: '123456')
      private_room = Room.create_private_room([user1, user2], 'room1')
      expect(private_room.participant?(private_room, user3)).to be_falsey
    end
  end
end