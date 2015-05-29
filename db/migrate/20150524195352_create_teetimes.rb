class CreateTeetimes < ActiveRecord::Migration
  def change
    create_table :teetimes do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :course_id
      t.integer :golfer_id
      t.time :teetime

      t.timestamps
    end
  end
end
