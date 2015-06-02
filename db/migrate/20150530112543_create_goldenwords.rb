class CreateGoldenwords < ActiveRecord::Migration
  def change
    create_table :goldenwords do |t|
      t.string :text
      t.integer :correct
      t.integer :wrong

      t.timestamps null: false
    end
  end
end
