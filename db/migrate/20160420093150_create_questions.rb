class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :creator_id
      t.string  :content
      t.string  :title

      t.timestamps
    end
  end
end
