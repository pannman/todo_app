class AddDoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :done, :boolean, default: false
  end
end
