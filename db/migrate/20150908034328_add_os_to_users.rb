class AddOsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :os, :string, after: :id, null: false, :default => 'Other'
  end
end
