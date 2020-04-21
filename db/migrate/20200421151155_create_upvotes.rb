class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.integer :voter_id
      t.integer :reply_id

      t.timestamps
    end
  end
end
