class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :creator
      t.string  :content
      t.references :question

      t.timestamps
    end
  end
end
