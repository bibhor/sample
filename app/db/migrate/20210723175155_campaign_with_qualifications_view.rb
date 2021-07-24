class CampaignWithQualificationsView < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
  		dir.up do 
  			execute <<-SQL
  			CREATE SQL SECURITY INVOKER
  			VIEW `campaign_qualifications_view` AS
  				(select c.id as campaign_id, count(cqq.campaign_quota_id) 
  					as qualifications_count from campaigns c
					join campaign_quotas cq on c.id=cq.campaign_id
					join campaign_quota_qualifications cqq on cq.id = cqq.campaign_quota_id
					group by cqq.campaign_quota_id)
			SQL
  		end

  		dir.down do
  			execute "DROP VIEW campaign_qualifications_view"
  		end
  	end
  end
end
