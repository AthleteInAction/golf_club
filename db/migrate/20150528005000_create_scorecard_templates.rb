class CreateScorecardTemplates < ActiveRecord::Migration
  def change
    create_table :scorecard_templates do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :tee
      t.integer :holes
      t.integer :slope
      t.decimal :rating,precision: 10,scale: 1
      t.string :pars
      t.string :yards
      t.string :handicaps

      t.timestamps
    end
  end
end