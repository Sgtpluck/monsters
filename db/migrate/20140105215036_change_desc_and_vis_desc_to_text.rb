class ChangeDescAndVisDescToText < ActiveRecord::Migration
  def change
    change_column :monsters, :description, :text, :limit => nil
    change_column :monsters, :visual_desc, :text, :limit => nil
  end
end
