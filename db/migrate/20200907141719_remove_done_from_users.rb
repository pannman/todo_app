class RemoveDoneFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :done, :boolean
  end
end
