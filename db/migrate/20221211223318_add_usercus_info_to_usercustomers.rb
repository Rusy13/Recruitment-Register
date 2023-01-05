class AddUsercusInfoToUsercustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :usercustomers, :full_name, :string
    add_column :usercustomers, :inn, :integer
    add_column :usercustomers, :number, :string
    add_column :usercustomers, :website, :string
  end
end
