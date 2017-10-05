class CreateNotificationRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :notification_requests do |t|
      t.string :email, null: false
      t.string :query, null: false

      t.timestamps null: false
    end
  end
end
