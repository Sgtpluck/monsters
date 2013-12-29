class AddingVisualDesc < ActiveRecord::Migration
  def change
    add_column :monsters, :visual_desc, :string
  end
end
