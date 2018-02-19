class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :retweets
      t.integer :favorites

      t.timestamps
    end
  end
end
