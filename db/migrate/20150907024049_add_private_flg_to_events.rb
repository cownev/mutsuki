class AddPrivateFlgToEvents < ActiveRecord::Migration
  def change
    add_column :events, :private_flg, :boolean, after: :date, null: false, :default => true
  end
end
