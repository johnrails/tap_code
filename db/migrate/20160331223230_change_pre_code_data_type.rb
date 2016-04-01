class ChangePreCodeDataType < ActiveRecord::Migration
  def change
    change_column :campaign_qualifications, :pre_codes, :text
  end
end
