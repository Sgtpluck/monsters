class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.float :cr
      t.string :environment

      t.timestamps
    end
  end
end
