class CampaignsController < ApplicationController

  def ordered_campaigns
    @first = CampaignQualification.where(question_id: 42)
  end
end
