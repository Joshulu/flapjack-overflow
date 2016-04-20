class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voter
      t.references :votable
      t.string :votable_type
      t.string  :vote_type

      t.timestamps
    end
  end
end
