require 'rails_helper'
describe CampaignsController do
	
	def response_body
		JSON.parse(response.body)
	end

	describe '#ordered_campaigns' do
		it 'returns correct json' do
			

			c = create(:campaign, name: "a", external_campaign_id: 1, length_of_interview: 2, cpi: 2)
			cq = create(:campaign_quota, campaign_id: c.id, num_respondents: 2)
			cqq = create(:campaign_quota_qualification, campaign_quota_id: cq.id, pre_codes: "2,3,4", question_id: 1)
			cqq1 = create(:campaign_quota_qualification, campaign_quota_id: cq.id, pre_codes: "5,6,7", question_id: 2)

			c1 = create(:campaign, name: "b", external_campaign_id: 2, length_of_interview: 2, cpi: 2)
			cq1 = create(:campaign_quota, campaign_id: c1.id, num_respondents: 2)
			cqq1 = create(:campaign_quota_qualification, campaign_quota_id: cq1.id, pre_codes: "2,3,4", question_id: 1)			

			get :ordered_campaigns
			result = response_body
			expect(result).not_to be_empty
			expect(result[0]["name"]).to eq("b")
		end
	end
end