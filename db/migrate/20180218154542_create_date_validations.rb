class CreateDateValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :date_validations do |t|
      t.datetime :project_lock
      t.string :session_name

      t.timestamps
    end
  end
end
