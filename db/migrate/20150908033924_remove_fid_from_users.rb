class RemoveFidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fid, :string
  end
end
