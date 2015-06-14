class AddBgColorToGoldenwords < ActiveRecord::Migration
  def change
    add_column :goldenwords, :bg_colour_hex, :string, limit: 6
  end
end
