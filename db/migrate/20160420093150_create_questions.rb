class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :creator
      t.string  :content
      t.string  :title

      t.timestamps
    end
  end
end
