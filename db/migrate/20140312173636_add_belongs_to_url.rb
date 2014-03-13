class AddBelongsToUrl < ActiveRecord::Migration
  def change
  	add_reference :accesses, :short_url, index: true 
  end
end
