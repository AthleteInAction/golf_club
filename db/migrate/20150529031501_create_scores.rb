class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :golfer_id
      t.integer :event_id
      t.integer :round_id
      t.integer :course_id
      t.integer :teetime_id
      t.integer :hole
      t.integer :par
      t.integer :yards
      t.integer :handicap
      t.integer :score

      t.timestamps
    end
  end
end
