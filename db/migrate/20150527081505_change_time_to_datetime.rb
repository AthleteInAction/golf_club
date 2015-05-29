class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
  	change_column :teetimes,:teetime,:datetime
  end
end