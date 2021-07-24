class CampaignQualifications < ActiveRecord::Migration[5.0]
def up
  	create_table :campaign_quota_qualifications do |t|
	  t.references :campaign_quota, null: false, index: true
      t.text :pre_codes
      t.integer :question_id
    end
  end

  def down
  	drop_table :campaign_quota_qualifications
  end
end
