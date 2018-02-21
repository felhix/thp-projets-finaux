class AddLockedToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :locked, :boolean, null: true, default: false
  end
end
