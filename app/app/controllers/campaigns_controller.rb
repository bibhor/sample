class CampaignsController < ApplicationController
	def ordered_campaigns
			
		result = Campaign.joins({campaign_quotas: :campaign_quota_qualifications}).joins(:campaign_qualification).order('campaign_qualifications_view.qualifications_count asc, campaigns.external_campaign_id asc').map do |c|
			{
				name: c.name,
				campaign_quotas: c.campaign_quotas.map do |cq|
					{
						num_respondents: cq.num_respondents,
						quota_qualifications: cq.campaign_quota_qualifications.map do |cqq|
							{
								pre_codes: cqq.pre_codes,
								question_id: cqq.question_id
							}
						end
					}
				end
			}
		end
		render json: result
	end
end