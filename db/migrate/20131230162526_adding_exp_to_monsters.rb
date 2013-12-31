class AddingExpToMonsters < ActiveRecord::Migration
  def change
    add_column :monsters, :exp, :integer
  end
end
