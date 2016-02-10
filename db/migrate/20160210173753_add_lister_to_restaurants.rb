class AddListerToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lister_id, :integer
  end
end
