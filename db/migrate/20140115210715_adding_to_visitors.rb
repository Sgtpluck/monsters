class AddingToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :pageview, :integer, default: 0
    add_column :visitors, :cookie_id, :string
  end
end