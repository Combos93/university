class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.integer :student_id
      t.integer :group_id

      t.index :student_id
      t.index :group_id

      t.timestamps
    end
  end
end
