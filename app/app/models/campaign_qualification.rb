class CampaignQualification < ApplicationRecord
	self.table_name = "campaign_qualifications_view"

	def readonly?
    	true
  	end
end
