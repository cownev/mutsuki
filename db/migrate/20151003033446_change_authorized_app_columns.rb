class ChangeAuthorizedAppColumns < ActiveRecord::Migration
  def change
    change_column :authorized_apps, :name, :string, :null => false
    change_column :authorized_apps, :key, :string, :null => false
  end
end
