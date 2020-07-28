class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.date :start_date
      t.date :finish_date

      t.belongs_to(:course, foreign_key: true)

      t.timestamps
    end
  end
end
