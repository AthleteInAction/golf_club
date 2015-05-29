class AddRoundIDtoTeetimes < ActiveRecord::Migration
  def change
  	add_column :teetimes,:round_id,:integer
  end
end