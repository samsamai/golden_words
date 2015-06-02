class AddDefaultValuesToGoldenwords < ActiveRecord::Migration
  def change
    change_column :goldenwords, :correct, :integer, :default => 0
    change_column :goldenwords, :wrong, :integer, :default => 0
  end
end
