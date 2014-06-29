class CreateAuthorizedApps < ActiveRecord::Migration
  def change
    create_table :authorized_apps do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
