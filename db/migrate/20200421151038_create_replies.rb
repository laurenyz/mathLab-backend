class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :replier_id
      t.integer :post_id
      t.text :reply_text

      t.timestamps
    end
  end
end
