class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :projects, :users, column: :manager_id
    add_foreign_key :bugs, :projects, column: :project_id
    add_foreign_key :bugs, :users, column: :creator_id
  end
end
