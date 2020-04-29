class CreateScratchpads < ActiveRecord::Migration[6.0]
  def change
    create_table :scratchpads do |t|
      t.text :scratchpad_text
      t.string :url

      t.timestamps
    end
  end
end
