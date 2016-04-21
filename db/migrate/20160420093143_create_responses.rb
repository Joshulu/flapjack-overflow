class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string  :content
      t.references :creator
      t.references :respondable
      t.string :respondable_type

      t.timestamps
    end
  end
end
