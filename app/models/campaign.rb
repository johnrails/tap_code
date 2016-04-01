class Campaign < ActiveRecord::Base

  validates :name, :length_of_interview, :cpi, presence: true

  has_many :campaign_quotas

  def self.with_question_id(id)
    Campaign.find_by_sql('SELECT * FROM campaigns c WHERE ( SELECT * from campaign_q)')
  end

  def self.seed_campaigns
    campaigns = CampaignService.get_campaigns
    campaigns.each do |campaign|
      Campaign.create(
          name:                campaign['name'],
          cpi:                 campaign['cpi'],
          days_in_field:       campaign['days_in_field'],
          id:                  campaign['id'],
          length_of_interview: campaign['length_of_interview'],
          status:              campaign['status'],
          supplier_link:       campaign['supplier_link'],
          total_remaining:     campaign['total_remaining']
      )
    end
  end

  def self.seed_campaign_quotas
    self.all.each do |campaign|
      create_campaign_data(campaign)
    end
  end

  def self.create_campaign_data(campaign)
      data = CampaignService.get_by_id(campaign.id)
      quota_data = data['campaign_quotas']
      quota_data.each do |quota|
        CampaignQuota.create!(
            name: quota['name'],
            num_respondents: quota['num_of_respondents'],
            id: quota['id'],
            campaign_id: campaign.id
        )

        quota['campaign_qualifications'].each do |cq|
          CampaignQualification.create!(
              question_id: cq['question_id'],
              pre_codes: cq['pre_codes'].join(','),
              campaign_quota_id: quota['id']
          )
        end
      end
  end
end
