class AddManualToTeetimes < ActiveRecord::Migration
  def change
  	add_column :teetimes,:manual,:boolean,default: false
  end
end