class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.integer :url_id
      t.timestamp :access_time
      t.string :ip_addr

      t.timestamps
    end
  end
end
