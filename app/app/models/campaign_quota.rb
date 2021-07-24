class CampaignQuota < ApplicationRecord
	self.table_name = "campaign_quotas"

	has_many :campaign_quota_qualifications, dependent: :destroy
	belongs_to :campaign
end