class AddBillingLocationToUserexecutor < ActiveRecord::Migration[7.0]
  def change
    add_column :userexecutors, :city, :string
    add_column :userexecutors, :country, :string
  end
end
