class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_id, :integer
  end

  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end
  
  def down
    remove_reference :tasks, :user, index: true
  end
end
