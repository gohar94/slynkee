class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.integer :user_id, null: false
    	t.string :device, null: false
    	t.string :content, limit: 5000, null: false
    	t.string :message, limit: 10000
    	t.timestamps
    end
  end
end
