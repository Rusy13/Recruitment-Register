class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.references :userexecutor, foreign_key: true
      t.references :usercustomer, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
