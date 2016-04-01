class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :cpi
      t.integer :days_in_field
      t.integer :incidence
      t.integer :status
      t.integer :length_of_interview
      t.integer :total_remaining
      t.string :supplier_link

      t.timestamps null: false
    end
  end
end
