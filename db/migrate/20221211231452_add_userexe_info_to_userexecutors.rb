class AddUserexeInfoToUserexecutors < ActiveRecord::Migration[7.0]
  def change
    add_column :userexecutors, :full_name, :string
    add_column :userexecutors, :category, :string
    add_column :userexecutors, :inn, :integer
    add_column :userexecutors, :number, :string
    add_column :userexecutors, :website, :string
    add_column :userexecutors, :free_date, :date
    add_column :userexecutors, :fee, :integer
    add_column :userexecutors, :role, :boolean
  end
end
