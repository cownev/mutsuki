class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string, after: :fid
  end
end
