class AddTaskState < ActiveRecord::Migration
  def up
    add_column :tasks, :state, :boolean, :default => false
  end

  def down
    remove_column :tasks, :state, :boolean, :default => false
  end
end