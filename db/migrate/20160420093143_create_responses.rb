class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :creator
      t.string  :content
      t.references :respondable
      t.string  :respondable_type

      t.timestamps
    end
  end
end
