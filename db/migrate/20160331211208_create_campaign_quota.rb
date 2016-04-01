class CreateCampaignQuota < ActiveRecord::Migration
  def change
    create_table :campaign_quota do |t|
      t.string :name
      t.integer :num_respondents
      t.integer :question_id
      t.string :pre_codes

      t.timestamps null: false
    end
  end
end
