class Campaigns < ActiveRecord::Migration[5.0]
  def up
  	create_table :campaigns do |t|
      t.string :name
      t.integer :external_campaign_id
      t.integer :length_of_interview
      t.decimal :cpi, :precision => 10, :scale => 1
      t.timestamps

      t.index :external_campaign_id, :unique => true
    end
  end

  def down
  	drop_table :campaigns
  end
end
