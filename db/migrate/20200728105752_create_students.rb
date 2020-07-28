class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :role, null: false
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :students, :email, unique: true
  end
end
