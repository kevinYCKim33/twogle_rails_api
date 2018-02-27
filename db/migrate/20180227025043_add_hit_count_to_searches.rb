class AddHitCountToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :hit_count, :integer, default: 0
  end
end
