class AddScorecardIDtoRound < ActiveRecord::Migration
  def change
  	add_column :rounds,:scorecard_id,:integer
  end
end