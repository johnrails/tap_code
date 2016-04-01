require 'rails_helper'

describe CampaignService do

  describe '#get_campaigns' do
    let!(:results) { CampaignService.get_campaigns }

    it 'will return an array of campaigns' do
      expect(results).to be_a(Array)
    end

    it 'will have campaign data' do
      expect(results.first).to have_key('cpi')
    end
  end
end