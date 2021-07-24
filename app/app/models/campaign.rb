class Campaign < ApplicationRecord
	has_many :campaign_quotas, dependent: :destroy
	has_one :campaign_qualification
end
