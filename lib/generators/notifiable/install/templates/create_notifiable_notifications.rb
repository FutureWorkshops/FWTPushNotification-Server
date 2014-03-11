class CreateNotifiableNotifications < ActiveRecord::Migration
  
  def change
    create_table :notifiable_notifications do |t|
      t.text :message
      t.text :params
      t.references :app
      
      #stats
      t.integer :sent_count
      t.integer :gateway_accepted_count
      
      # APNS - Optional
      #t.integer :badge
      #t.text :sound
      #t.datetime :expiry
      
      # MPNS - Optional
      #t.text :title
      
      t.timestamps
    end
  end

end
