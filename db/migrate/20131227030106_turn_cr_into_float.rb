class TurnCrIntoFloat < ActiveRecord::Migration
  def change
    change_column :monsters, :cr, :float
  end
end
