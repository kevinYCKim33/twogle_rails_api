class AddSearchUrlToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :search_url, :string
  end
end
