class CreateUserScratchpads < ActiveRecord::Migration[6.0]
  def change
    create_table :user_scratchpads do |t|
      t.integer :user_id
      t.integer :scratchpad_id
      t.string :name

      t.timestamps
    end
  end
end
