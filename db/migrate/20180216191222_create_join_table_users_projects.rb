class CreateJoinTableUsersProjects < ActiveRecord::Migration[5.1]
  def change
  	 create_join_table :users, :projects do |t|
       t.index [:project_id, :user_id]
       t.index [:user_id, :project_id]
    end
  end
end
