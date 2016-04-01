class CampaignService

  def self.get_campaigns
    HTTParty.get("#{base_url}campaigns", headers: headers)
  end

  def self.get_by_id(id)
    HTTParty.get("#{base_url}campaigns/#{id}", headers: headers)
  end

  private

  def self.auth
    Base64::encode64("codetest@tapresearch.com:76b2ef0268a9177927a95bd4db4b8dbc").gsub(/\n/, '')
  end

  def self.options
    {basic_auth: auth }
  end

  def self.headers
    {'Authorization' => "Basic #{auth}" }
  end

  def self.base_url
    "http://staging.tapresearch.com/api/v1/"
  end
end