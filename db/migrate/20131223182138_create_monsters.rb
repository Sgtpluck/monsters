class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :cr
      t.string :environment
      t.string :description
      t.string :photo
      t.string :type

      t.timestamps
    end
  end
end
