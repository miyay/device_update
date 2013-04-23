class CreateUpdateInfos < ActiveRecord::Migration
  def change
    create_table :update_infos do |t|
      t.string :device_name
      t.date :update_start_at
      t.string :update_method
      t.date :update_deadline_at
      t.text :note

      t.timestamps
    end
  end
end
