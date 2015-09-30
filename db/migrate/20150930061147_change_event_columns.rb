class ChangeEventColumns < ActiveRecord::Migration
  def change
    change_column :events, :name, :string, :null => false
    change_column :events, :date, :date, :null => false
    change_column :events, :creator_user_id, :int, :null => false
  end
end
