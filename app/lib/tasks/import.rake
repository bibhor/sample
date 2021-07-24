require 'uri'
require 'net/http'
namespace :import do
	def api_call(url)
		uri = URI.parse(url)
		request = Net::HTTP::Get.new(uri)
		request.content_type = "application/json"
		request["Authorization"] = "Basic Y29kZXRlc3RAdGFwLmNvbToxYzdkZDZmZDJhOTRiMmU2NDMxYjM2NzE4OWFlYWQwMQ=="

		req_options = {
		  use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  http.request(request)
		end
		response
	end

	desc "campaigns"        # description.
	task :campaigns => :environment do
		response = api_call("https://staging.tapresearch.com/api/v1/campaigns")
		campaigns = JSON.parse(response.body)
		campaigns.each do |c|
			_c = Campaign.create(
							name: c["name"], 
							external_campaign_id: c["id"], 
							length_of_interview: c["length_of_interview"],
							cpi: c["cpi"]
							)
			cr = api_call("https://staging.tapresearch.com/api/v1/campaigns/#{c["id"]}")
			
			campaign_response = JSON.parse(cr.body)

			campaign_response["campaign_quotas"].each do |q|
				quota = CampaignQuota.create(
											campaign_id: _c.id, 
											num_respondents: q["num_respondents"]
											)
				q["campaign_qualifications"].each do |cq|
					CampaignQuotaQualification.create(
														campaign_quota_id: quota.id,
														pre_codes: cq["pre_codes"].join(","),
														question_id: cq["question_id"]
													)
				end
			end
		end
	end

end