class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.integer :project_id
      t.string :title
      t.integer :assignee_id
      t.integer :status
      t.string :description
      t.integer :creator_id
      t.date :deadline
      t.integer :bug_type

      t.timestamps
    end
  end
end
