require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:length_of_interview) }
  it { is_expected.to validate_presence_of(:cpi) }

  it { is_expected.to have_many(:campaign_quotas)}

  describe "#seed_campagins" do

    let(:campaign_data) do
      [
          {
              "cpi": "3.15",
              "days_in_field": 3,
              "id": 14706,
              "incidence": 10,
              "length_of_interview": 20,
              "name": "Test Survey 1",
              "status": 2,
              "supplier_link": "https://api.samplecompany.com/survey/1?id=",
              "total_remaining": 6
          },
          {
              "cpi": "3.69",
              "days_in_field": 10,
              "id": 14707,
              "incidence": 20,
              "length_of_interview": 15,
              "name": "Test Survey 2",
              "status": 2,
              "supplier_link": "https://api.samplecompany.com/survey/2?id=",
              "total_remaining": 37
          }
      ]
    end

    before :each do
      expect(CampaignService).to receive(:get_campaigns).and_return(campaign_data)
    end

    it 'will call the CampaignService' do
      described_class.seed_campaigns
    end

  end
end
