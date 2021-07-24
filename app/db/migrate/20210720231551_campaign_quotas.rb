class CampaignQuotas < ActiveRecord::Migration[5.0]
  def up
  	create_table :campaign_quotas do |t|
  	  t.references :campaign, null: false
      t.integer :num_respondents
    end
  end

  def down
  	drop_table :campaign_quotas
  end
end
