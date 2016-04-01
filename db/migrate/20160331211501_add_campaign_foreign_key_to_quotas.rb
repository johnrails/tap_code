class AddCampaignForeignKeyToQuotas < ActiveRecord::Migration
  def change
    add_column :campaign_quota, :campaign_id, :integer

    add_index :campaign_quota, :campaign_id
  end
end
