class AddColumnsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :expired_at, :datetime
    add_column :tasks, :status, :string
    add_column :tasks, :priority, :string
  end
end