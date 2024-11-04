class CreateItemReports < ActiveRecord::Migration[7.2]
  def change
    create_table :item_reports do |t|
      t.string :item_name
      t.integer :report_count
      t.datetime :last_reported_at
      t.string :status

      t.timestamps
    end
  end
end
