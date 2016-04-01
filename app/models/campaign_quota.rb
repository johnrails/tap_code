class CampaignQuota < ActiveRecord::Base

  # validates :name, :num_respondents, presence: true

  has_many :campaign_qualifications
end
