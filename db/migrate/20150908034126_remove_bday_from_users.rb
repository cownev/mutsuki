class RemoveBdayFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :bday, :date
  end
end
