class RemoveUrlIdFromAccess < ActiveRecord::Migration
  def change
  	remove_column :accesses, :url_id
  end
end
