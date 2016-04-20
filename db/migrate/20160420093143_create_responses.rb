class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :creator_id
      t.string  :content
      t.integer :respondable_id
      t.string  :respondable_type

      t.timestamps
    end
  end
end
