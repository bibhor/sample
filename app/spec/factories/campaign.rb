FactoryBot.define do
  factory :campaign do
    name { 'a' }
    external_campaign_id { 12345 }
    length_of_interview {10}
    cpi {1}
  end
end