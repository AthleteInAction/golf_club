class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :course_id
      t.date :start_date

      t.timestamps
    end
  end
end
