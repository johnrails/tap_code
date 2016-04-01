class CreateCampaignQualifications < ActiveRecord::Migration
  def change
    create_table :campaign_qualifications do |t|
      t.integer :question_id
      t.string :pre_codes
      t.integer :campaign_quota_id

      t.timestamps null: false
    end
  end
end
