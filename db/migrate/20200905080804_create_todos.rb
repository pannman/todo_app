class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.text :todo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :todos, [:user_id, :created_at]
  end
end
